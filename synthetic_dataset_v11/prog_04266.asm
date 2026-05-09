; DESCRIPTION: Renders a orange box of size 119x37 starting at (93, 147).
; PLAN: r0=93(x), r1=147(y), r2=119(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 147
LDI r2, 119
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
