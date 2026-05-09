; DESCRIPTION: Creates a red rectangular region at (6, 100) spanning 99 by 96 pixels.
; PLAN: r0=6(x), r1=100(y), r2=99(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 100
LDI r2, 99
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
