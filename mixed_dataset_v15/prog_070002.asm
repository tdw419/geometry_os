; DESCRIPTION: Draws a blue rectangle at (379, 32) with width 44 and height 59.
; PLAN: r0=379(x), r1=32(y), r2=44(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 32
LDI r2, 44
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
