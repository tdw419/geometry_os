; DESCRIPTION: Renders a red box of size 100x108 starting at (269, 57).
; PLAN: r0=269(x), r1=57(y), r2=100(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 57
LDI r2, 100
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
