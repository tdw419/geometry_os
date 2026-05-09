; DESCRIPTION: Renders a red box of size 115x17 starting at (5, 130).
; PLAN: r0=5(x), r1=130(y), r2=115(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 130
LDI r2, 115
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
