; DESCRIPTION: Renders a red box of size 38x100 starting at (5, 17).
; PLAN: r0=5(x), r1=17(y), r2=38(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 17
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
