; DESCRIPTION: Renders a black box of size 86x41 starting at (93, 91).
; PLAN: r0=93(x), r1=91(y), r2=86(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 91
LDI r2, 86
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
