; DESCRIPTION: Renders a green box of size 17x41 starting at (5, 68).
; PLAN: r0=5(x), r1=68(y), r2=17(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 68
LDI r2, 17
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
