; DESCRIPTION: Renders a red box of size 119x110 starting at (236, 69).
; PLAN: r0=236(x), r1=69(y), r2=119(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 69
LDI r2, 119
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
