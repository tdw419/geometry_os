; DESCRIPTION: Creates a orange rectangular region at (431, 121) spanning 25 by 116 pixels.
; PLAN: r0=431(x), r1=121(y), r2=25(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 121
LDI r2, 25
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
