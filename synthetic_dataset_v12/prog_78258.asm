; DESCRIPTION: Renders a red box of size 115x74 starting at (99, 145).
; PLAN: r0=99(x), r1=145(y), r2=115(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 145
LDI r2, 115
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
