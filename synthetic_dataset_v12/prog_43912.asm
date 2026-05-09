; DESCRIPTION: Renders a black box of size 91x78 starting at (98, 154).
; PLAN: r0=98(x), r1=154(y), r2=91(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 154
LDI r2, 91
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
