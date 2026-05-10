; DESCRIPTION: Renders a green box of size 41x66 starting at (208, 168).
; PLAN: r0=208(x), r1=168(y), r2=41(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 168
LDI r2, 41
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
