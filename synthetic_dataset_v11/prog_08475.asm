; DESCRIPTION: Renders a red box of size 45x54 starting at (12, 147).
; PLAN: r0=12(x), r1=147(y), r2=45(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 147
LDI r2, 45
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
