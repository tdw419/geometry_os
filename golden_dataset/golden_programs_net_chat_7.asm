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

LDI r9, 1              ; increment constant
LDI r7, 256            ; screen width
LDI r10, 0              ; frame counter

; Clear screen to dark blue
LDI r0, 0x000033
FILL r0

; Draw title bar
LDI r0, 0x00
LDI r13, 0
LDI r1, 256
LDI r2, 1
LDI r4, 0x333333
RECTF r0, r13, r1, r2, r4

; Draw status bar at bottom
LDI r0, 0
LDI r13, 250
LDI r1, 256
LDI r2, 6
LDI r4, 0x222222
RECTF r0, r13, r1, r2, r4

; Write "Pixel Chat - Waiting..." text at top
LDI r14, 0x2000
LDI r3, 80             ; 'P'
STORE r14, r3
LDI r14, 0x2001
LDI r3, 105            ; 'i'
STORE r14, r3
LDI r14, 0x2002
LDI r3, 120            ; 'x'
STORE r14, r3
LDI r14, 0x2003
LDI r3, 101            ; 'e'
STORE r14, r3
LDI r14, 0x2004
LDI r3, 108            ; 'l'
STORE r14, r3
LDI r14, 0x2005
LDI r3, 0              ; null
STORE r14, r3

LDI r14, 0x2000
LDI r3, 2
LDI r8, 8
LDI r12, 0xFFFFFF
TEXT r14, r3, r12

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r10, r9
  LDI r0, 0xFFE
  STORE r0, r10

  ; Poll NET_RECV
  LDI r0, 0x7100     ; receive buffer
  LDI r13, 256        ; max length
  NET_RECV r0, r13

  ; Check if we got data (r15 > 0 means data received)
  LDI r1, 0
  CMP r15, r1
  JZ r15, no_data

  ; Data received! Check frame type
  LDI r2, 0x7100
  LOAD r2, r2         ; r2 = frame type
  LDI r4, 1
  CMP r2, r4
  JZ r15, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r0, 0x003300
  FILL r0
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r0, 0
  LDI r13, 250
  LDI r1, 256
  LDI r2, 6
  LDI r4, 0x004400    ; green tint = message received
  RECTF r0, r13, r1, r2, r4
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r0, 0xFFE
  LOAD r0, r0         ; r0 = TICKS
  LDI r13, 30
  AND r0, r13          ; r0 = TICKS & 30
  LDI r13, 15
  CMP r0, r13
  BLT r15, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r0, 128
  LDI r13, 4
  LDI r1, 0x000000
  PSET r0, r13, r1
  FRAME
  JMP main_loop

dot_on:
  LDI r0, 128
  LDI r13, 4
  LDI r1, 0xFFFFFF
  PSET r0, r13, r1
  FRAME
  JMP main_loop

HALT
