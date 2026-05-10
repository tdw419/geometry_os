; DESCRIPTION: Creates a orange rectangular region at (36, 44) spanning 116 by 39 pixels.
; PLAN: r0=36(x), r1=44(y), r2=116(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 44
LDI r2, 116
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
