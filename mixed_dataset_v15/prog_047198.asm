; DESCRIPTION: Renders a black box of size 117x91 starting at (63, 130).
; PLAN: r0=63(x), r1=130(y), r2=117(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 130
LDI r2, 117
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
