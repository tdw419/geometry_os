; DESCRIPTION: Renders a red box of size 45x94 starting at (219, 20).
; PLAN: r0=219(x), r1=20(y), r2=45(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 20
LDI r2, 45
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
