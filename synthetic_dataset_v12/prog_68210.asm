; DESCRIPTION: Creates a orange rectangular region at (111, 116) spanning 33 by 58 pixels.
; PLAN: r0=111(x), r1=116(y), r2=33(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 116
LDI r2, 33
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
