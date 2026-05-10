; DESCRIPTION: Renders a red box of size 49x22 starting at (45, 102).
; PLAN: r0=45(x), r1=102(y), r2=49(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 102
LDI r2, 49
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
