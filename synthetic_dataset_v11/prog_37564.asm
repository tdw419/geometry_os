; DESCRIPTION: Renders a green box of size 20x31 starting at (207, 41).
; PLAN: r0=207(x), r1=41(y), r2=20(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 41
LDI r2, 20
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
