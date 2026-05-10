; DESCRIPTION: Renders a green box of size 89x17 starting at (252, 194).
; PLAN: r0=252(x), r1=194(y), r2=89(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 194
LDI r2, 89
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
