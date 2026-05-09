; DESCRIPTION: Creates a orange rectangular region at (109, 57) spanning 76 by 116 pixels.
; PLAN: r0=109(x), r1=57(y), r2=76(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 57
LDI r2, 76
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
