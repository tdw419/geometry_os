; DESCRIPTION: Draws a blue rectangle at (129, 107) with width 107 and height 99.
; PLAN: r0=129(x), r1=107(y), r2=107(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 107
LDI r2, 107
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
