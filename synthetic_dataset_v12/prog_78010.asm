; DESCRIPTION: Draws a blue rectangle at (444, 106) with width 44 and height 71.
; PLAN: r0=444(x), r1=106(y), r2=44(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 106
LDI r2, 44
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
