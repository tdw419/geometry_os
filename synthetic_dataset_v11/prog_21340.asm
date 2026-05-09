; DESCRIPTION: Renders a green box of size 41x117 starting at (78, 139).
; PLAN: r0=78(x), r1=139(y), r2=41(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 139
LDI r2, 41
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
