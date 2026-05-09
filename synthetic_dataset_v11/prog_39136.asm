; DESCRIPTION: Renders a black box of size 14x63 starting at (192, 71).
; PLAN: r0=192(x), r1=71(y), r2=14(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 71
LDI r2, 14
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
