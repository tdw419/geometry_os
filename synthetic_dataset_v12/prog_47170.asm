; DESCRIPTION: Draws a blue rectangle at (354, 151) with width 73 and height 32.
; PLAN: r0=354(x), r1=151(y), r2=73(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 151
LDI r2, 73
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
