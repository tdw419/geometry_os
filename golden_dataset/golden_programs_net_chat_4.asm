; DESCRIPTION: This GeOS assembly code implements a pixel-based chat demo that listens for incoming network frames using the NET_RECV function. It displays received pixel data on the screen and shows text messages in a status bar. The demo also includes a simple animated waiting indicator to signify activity.

; net_chat.asm -- Pixel Chat Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates bidirectional NET_RECV for receiving pixel data from a peer.
; Listens for incoming pixel protocol frames and displays them on screen.
; Also shows a simple text interface using NET_SEND for chat messages.
;
; For testing without a real network: push frames into vm.net_inbox
; using the test harness. The demo polls NET_RECV each frame.
;
; Protocol:
;   Frame type 0 (screen_share): display pixels on screen
;   Frame type 1 (chat): display text message in status bar

LDI r8, 1              ; increment constant
LDI r0, 256            ; screen width
LDI r7, 0              ; frame counter

; Clear screen to dark blue
LDI r1, 0x000033
FILL r1

; Draw title bar
LDI r1, 0x00
LDI r9, 0
LDI r10, 256
LDI r6, 1
LDI r15, 0x333333
RECTF r1, r9, r10, r6, r15

; Draw status bar at bottom
LDI r1, 0
LDI r9, 250
LDI r10, 256
LDI r6, 6
LDI r15, 0x222222
RECTF r1, r9, r10, r6, r15

; Write "Pixel Chat - Waiting..." text at top
LDI r4, 0x2000
LDI r12, 80             ; 'P'
STORE r4, r12
LDI r4, 0x2001
LDI r12, 105            ; 'i'
STORE r4, r12
LDI r4, 0x2002
LDI r12, 120            ; 'x'
STORE r4, r12
LDI r4, 0x2003
LDI r12, 101            ; 'e'
STORE r4, r12
LDI r4, 0x2004
LDI r12, 108            ; 'l'
STORE r4, r12
LDI r4, 0x2005
LDI r12, 0              ; null
STORE r4, r12

LDI r4, 0x2000
LDI r12, 2
LDI r13, 8
LDI r3, 0xFFFFFF
TEXT r4, r12, r3

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r7, r8
  LDI r1, 0xFFE
  STORE r1, r7

  ; Poll NET_RECV
  LDI r1, 0x7100     ; receive buffer
  LDI r9, 256        ; max length
  NET_RECV r1, r9

  ; Check if we got data (r2 > 0 means data received)
  LDI r10, 0
  CMP r2, r10
  JZ r2, no_data

  ; Data received! Check frame type
  LDI r6, 0x7100
  LOAD r6, r6         ; r6 = frame type
  LDI r15, 1
  CMP r6, r15
  JZ r2, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r1, 0x003300
  FILL r1
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r1, 0
  LDI r9, 250
  LDI r10, 256
  LDI r6, 6
  LDI r15, 0x004400    ; green tint = message received
  RECTF r1, r9, r10, r6, r15
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r1, 0xFFE
  LOAD r1, r1         ; r1 = TICKS
  LDI r9, 30
  AND r1, r9          ; r1 = TICKS & 30
  LDI r9, 15
  CMP r1, r9
  BLT r2, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r1, 128
  LDI r9, 4
  LDI r10, 0x000000
  PSET r1, r9, r10
  FRAME
  JMP main_loop

dot_on:
  LDI r1, 128
  LDI r9, 4
  LDI r10, 0xFFFFFF
  PSET r1, r9, r10
  FRAME
  JMP main_loop

HALT
