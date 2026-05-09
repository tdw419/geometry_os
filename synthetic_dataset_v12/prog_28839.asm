; DESCRIPTION: Renders a blue box of size 83x12 starting at (170, 9).
; PLAN: r0=170(x), r1=9(y), r2=83(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 9
LDI r2, 83
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
