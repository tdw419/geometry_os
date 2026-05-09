; DESCRIPTION: Renders a red box of size 116x13 starting at (274, 32).
; PLAN: r0=274(x), r1=32(y), r2=116(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 32
LDI r2, 116
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
