; DESCRIPTION: Renders a red box of size 88x48 starting at (68, 48).
; PLAN: r0=68(x), r1=48(y), r2=88(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 48
LDI r2, 88
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
