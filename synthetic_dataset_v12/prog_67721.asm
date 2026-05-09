; DESCRIPTION: Creates a orange rectangular region at (312, 143) spanning 60 by 96 pixels.
; PLAN: r0=312(x), r1=143(y), r2=60(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 143
LDI r2, 60
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
