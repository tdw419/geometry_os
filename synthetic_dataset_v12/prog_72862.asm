; DESCRIPTION: Renders a black box of size 23x65 starting at (192, 50).
; PLAN: r0=192(x), r1=50(y), r2=23(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 50
LDI r2, 23
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
