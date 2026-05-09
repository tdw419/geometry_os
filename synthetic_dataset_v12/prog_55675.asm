; DESCRIPTION: Renders a red box of size 74x48 starting at (22, 140).
; PLAN: r0=22(x), r1=140(y), r2=74(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 140
LDI r2, 74
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
