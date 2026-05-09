; DESCRIPTION: Renders a red box of size 19x37 starting at (94, 123).
; PLAN: r0=94(x), r1=123(y), r2=19(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 123
LDI r2, 19
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
