; DESCRIPTION: Creates a orange rectangular region at (418, 56) spanning 15 by 116 pixels.
; PLAN: r0=418(x), r1=56(y), r2=15(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 56
LDI r2, 15
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
