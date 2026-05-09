; DESCRIPTION: Renders a blue box of size 45x32 starting at (147, 130).
; PLAN: r0=147(x), r1=130(y), r2=45(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 130
LDI r2, 45
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
