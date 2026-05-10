; DESCRIPTION: Draws a blue rectangle at (32, 151) with width 36 and height 18.
; PLAN: r0=32(x), r1=151(y), r2=36(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 151
LDI r2, 36
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
