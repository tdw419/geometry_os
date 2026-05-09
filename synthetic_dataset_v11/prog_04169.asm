; DESCRIPTION: Renders a green box of size 78x117 starting at (18, 9).
; PLAN: r0=18(x), r1=9(y), r2=78(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 9
LDI r2, 78
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
