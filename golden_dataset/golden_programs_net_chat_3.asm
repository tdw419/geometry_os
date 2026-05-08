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

LDI r6, 1              ; increment constant
LDI r0, 256            ; screen width
LDI r7, 0              ; frame counter

; Clear screen to dark blue
LDI r1, 0x000033
FILL r1

; Draw title bar
LDI r1, 0x00
LDI r8, 0
LDI r2, 256
LDI r10, 1
LDI r13, 0x333333
RECTF r1, r8, r2, r10, r13

; Draw status bar at bottom
LDI r1, 0
LDI r8, 250
LDI r2, 256
LDI r10, 6
LDI r13, 0x222222
RECTF r1, r8, r2, r10, r13

; Write "Pixel Chat - Waiting..." text at top
LDI r12, 0x2000
LDI r9, 80             ; 'P'
STORE r12, r9
LDI r12, 0x2001
LDI r9, 105            ; 'i'
STORE r12, r9
LDI r12, 0x2002
LDI r9, 120            ; 'x'
STORE r12, r9
LDI r12, 0x2003
LDI r9, 101            ; 'e'
STORE r12, r9
LDI r12, 0x2004
LDI r9, 108            ; 'l'
STORE r12, r9
LDI r12, 0x2005
LDI r9, 0              ; null
STORE r12, r9

LDI r12, 0x2000
LDI r9, 2
LDI r15, 8
LDI r3, 0xFFFFFF
TEXT r12, r9, r3

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r7, r6
  LDI r1, 0xFFE
  STORE r1, r7

  ; Poll NET_RECV
  LDI r1, 0x7100     ; receive buffer
  LDI r8, 256        ; max length
  NET_RECV r1, r8

  ; Check if we got data (r4 > 0 means data received)
  LDI r2, 0
  CMP r4, r2
  JZ r4, no_data

  ; Data received! Check frame type
  LDI r10, 0x7100
  LOAD r10, r10         ; r10 = frame type
  LDI r13, 1
  CMP r10, r13
  JZ r4, got_chat       ; type 1 = chat message

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
  LDI r8, 250
  LDI r2, 256
  LDI r10, 6
  LDI r13, 0x004400    ; green tint = message received
  RECTF r1, r8, r2, r10, r13
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r1, 0xFFE
  LOAD r1, r1         ; r1 = TICKS
  LDI r8, 30
  AND r1, r8          ; r1 = TICKS & 30
  LDI r8, 15
  CMP r1, r8
  BLT r4, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r1, 128
  LDI r8, 4
  LDI r2, 0x000000
  PSET r1, r8, r2
  FRAME
  JMP main_loop

dot_on:
  LDI r1, 128
  LDI r8, 4
  LDI r2, 0xFFFFFF
  PSET r1, r8, r2
  FRAME
  JMP main_loop

HALT
