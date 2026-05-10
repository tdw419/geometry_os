; DESCRIPTION: Renders a black box of size 23x75 starting at (316, 72).
; PLAN: r0=316(x), r1=72(y), r2=23(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 72
LDI r2, 23
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
