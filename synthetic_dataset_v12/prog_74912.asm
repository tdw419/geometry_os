; DESCRIPTION: Renders a black box of size 110x45 starting at (130, 30).
; PLAN: r0=130(x), r1=30(y), r2=110(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 30
LDI r2, 110
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
