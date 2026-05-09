; DESCRIPTION: Draws a blue rectangle at (441, 34) with width 71 and height 77.
; PLAN: r0=441(x), r1=34(y), r2=71(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 34
LDI r2, 71
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
