; DESCRIPTION: Renders a red box of size 22x95 starting at (216, 49).
; PLAN: r0=216(x), r1=49(y), r2=22(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 49
LDI r2, 22
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
