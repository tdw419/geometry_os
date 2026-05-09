; DESCRIPTION: Renders a black box of size 48x58 starting at (309, 110).
; PLAN: r0=309(x), r1=110(y), r2=48(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 110
LDI r2, 48
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
