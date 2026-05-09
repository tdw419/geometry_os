; DESCRIPTION: Renders a green box of size 78x12 starting at (395, 95).
; PLAN: r0=395(x), r1=95(y), r2=78(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 95
LDI r2, 78
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
