; DESCRIPTION: Draws a yellow rectangle at (260, 109) with width 78 and height 107.
; PLAN: r0=260(x), r1=109(y), r2=78(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 109
LDI r2, 78
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
