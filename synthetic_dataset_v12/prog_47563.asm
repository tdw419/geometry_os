; DESCRIPTION: Renders a red box of size 30x110 starting at (172, 89).
; PLAN: r0=172(x), r1=89(y), r2=30(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 89
LDI r2, 30
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
