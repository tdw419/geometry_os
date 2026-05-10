; DESCRIPTION: Renders a red box of size 35x33 starting at (216, 105).
; PLAN: r0=216(x), r1=105(y), r2=35(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 105
LDI r2, 35
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
