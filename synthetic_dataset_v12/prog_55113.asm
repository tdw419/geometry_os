; DESCRIPTION: Renders a red box of size 52x55 starting at (132, 18).
; PLAN: r0=132(x), r1=18(y), r2=52(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 18
LDI r2, 52
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
