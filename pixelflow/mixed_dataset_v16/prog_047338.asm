; DESCRIPTION: Renders a blue box of size 91x33 starting at (27, 41).
; PLAN: r0=27(x), r1=41(y), r2=91(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 41
LDI r2, 91
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
