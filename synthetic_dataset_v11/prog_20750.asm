; DESCRIPTION: Renders a red box of size 32x116 starting at (44, 3).
; PLAN: r0=44(x), r1=3(y), r2=32(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 3
LDI r2, 32
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
