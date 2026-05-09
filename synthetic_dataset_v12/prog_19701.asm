; DESCRIPTION: Creates a orange rectangular region at (389, 61) spanning 38 by 114 pixels.
; PLAN: r0=389(x), r1=61(y), r2=38(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 61
LDI r2, 38
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
