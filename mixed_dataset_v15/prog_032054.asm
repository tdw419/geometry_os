; DESCRIPTION: Renders a green box of size 106x41 starting at (193, 193).
; PLAN: r0=193(x), r1=193(y), r2=106(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 193
LDI r2, 106
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
