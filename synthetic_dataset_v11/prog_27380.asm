; DESCRIPTION: Renders a red box of size 88x102 starting at (27, 16).
; PLAN: r0=27(x), r1=16(y), r2=88(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 16
LDI r2, 88
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
