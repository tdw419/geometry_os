; DESCRIPTION: Renders a black box of size 84x37 starting at (152, 130).
; PLAN: r0=152(x), r1=130(y), r2=84(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 130
LDI r2, 84
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
