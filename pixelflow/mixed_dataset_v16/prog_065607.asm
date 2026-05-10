; DESCRIPTION: Renders a black box of size 15x117 starting at (468, 20).
; PLAN: r0=468(x), r1=20(y), r2=15(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 20
LDI r2, 15
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
