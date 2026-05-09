; DESCRIPTION: Creates a red rectangular region at (109, 100) spanning 96 by 36 pixels.
; PLAN: r0=109(x), r1=100(y), r2=96(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 100
LDI r2, 96
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
