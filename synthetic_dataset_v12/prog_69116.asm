; DESCRIPTION: Renders a red box of size 110x85 starting at (2, 104).
; PLAN: r0=2(x), r1=104(y), r2=110(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 104
LDI r2, 110
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
