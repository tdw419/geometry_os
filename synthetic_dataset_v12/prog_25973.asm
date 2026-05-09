; DESCRIPTION: Creates a red rectangular region at (312, 157) spanning 100 by 20 pixels.
; PLAN: r0=312(x), r1=157(y), r2=100(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 157
LDI r2, 100
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
