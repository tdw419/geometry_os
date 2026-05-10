; DESCRIPTION: Renders a black box of size 22x89 starting at (111, 9).
; PLAN: r0=111(x), r1=9(y), r2=22(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 9
LDI r2, 22
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
