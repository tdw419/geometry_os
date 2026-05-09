; DESCRIPTION: Creates a red rectangular region at (128, 143) spanning 35 by 100 pixels.
; PLAN: r0=128(x), r1=143(y), r2=35(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 143
LDI r2, 35
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
