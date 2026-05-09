; DESCRIPTION: Renders a red box of size 115x69 starting at (44, 78).
; PLAN: r0=44(x), r1=78(y), r2=115(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 78
LDI r2, 115
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
