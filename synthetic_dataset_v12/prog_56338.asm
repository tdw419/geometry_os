; DESCRIPTION: Renders a black box of size 45x66 starting at (275, 147).
; PLAN: r0=275(x), r1=147(y), r2=45(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 147
LDI r2, 45
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
