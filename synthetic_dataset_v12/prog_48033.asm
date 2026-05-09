; DESCRIPTION: Renders a red box of size 99x89 starting at (273, 137).
; PLAN: r0=273(x), r1=137(y), r2=99(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 137
LDI r2, 99
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
