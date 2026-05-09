; DESCRIPTION: Renders a red box of size 91x37 starting at (139, 66).
; PLAN: r0=139(x), r1=66(y), r2=91(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 66
LDI r2, 91
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
