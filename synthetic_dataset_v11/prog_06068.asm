; DESCRIPTION: Creates a orange rectangular region at (60, 82) spanning 116 by 33 pixels.
; PLAN: r0=60(x), r1=82(y), r2=116(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 82
LDI r2, 116
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
