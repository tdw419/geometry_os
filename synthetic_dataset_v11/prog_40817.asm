; DESCRIPTION: Renders a black box of size 19x71 starting at (75, 2).
; PLAN: r0=75(x), r1=2(y), r2=19(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 2
LDI r2, 19
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
