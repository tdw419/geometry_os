; DESCRIPTION: Renders a green box of size 78x93 starting at (25, 41).
; PLAN: r0=25(x), r1=41(y), r2=78(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 41
LDI r2, 78
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
