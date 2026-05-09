; DESCRIPTION: Creates a red rectangular region at (334, 143) spanning 100 by 35 pixels.
; PLAN: r0=334(x), r1=143(y), r2=100(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 143
LDI r2, 100
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
