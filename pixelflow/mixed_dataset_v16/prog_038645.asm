; DESCRIPTION: Renders a red box of size 30x102 starting at (253, 145).
; PLAN: r0=253(x), r1=145(y), r2=30(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 145
LDI r2, 30
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
