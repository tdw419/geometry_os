; DESCRIPTION: Renders a red box of size 22x88 starting at (100, 16).
; PLAN: r0=100(x), r1=16(y), r2=22(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 16
LDI r2, 22
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
