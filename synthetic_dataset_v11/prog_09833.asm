; DESCRIPTION: Renders a red box of size 63x52 starting at (4, 123).
; PLAN: r0=4(x), r1=123(y), r2=63(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 123
LDI r2, 63
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
