; DESCRIPTION: Creates a orange rectangular region at (434, 34) spanning 62 by 114 pixels.
; PLAN: r0=434(x), r1=34(y), r2=62(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 34
LDI r2, 62
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
