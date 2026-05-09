; DESCRIPTION: Renders a black box of size 20x91 starting at (247, 52).
; PLAN: r0=247(x), r1=52(y), r2=20(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 52
LDI r2, 20
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
