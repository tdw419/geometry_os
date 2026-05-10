; DESCRIPTION: Draws a purple rectangle at (48, 20) with width 77 and height 33.
; PLAN: r0=48(x), r1=20(y), r2=77(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 20
LDI r2, 77
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
