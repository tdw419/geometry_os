; DESCRIPTION: Renders a red box of size 66x119 starting at (154, 88).
; PLAN: r0=154(x), r1=88(y), r2=66(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 88
LDI r2, 66
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
