; DESCRIPTION: Renders a green box of size 99x79 starting at (131, 41).
; PLAN: r0=131(x), r1=41(y), r2=99(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 41
LDI r2, 99
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
