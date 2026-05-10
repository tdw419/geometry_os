; DESCRIPTION: Draws a blue rectangle at (253, 159) with width 77 and height 18.
; PLAN: r0=253(x), r1=159(y), r2=77(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 159
LDI r2, 77
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
