; DESCRIPTION: Renders a red box of size 101x99 starting at (20, 147).
; PLAN: r0=20(x), r1=147(y), r2=101(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 147
LDI r2, 101
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
