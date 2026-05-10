; DESCRIPTION: Creates a orange rectangular region at (13, 13) spanning 44 by 82 pixels.
; PLAN: r0=13(x), r1=13(y), r2=44(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 13
LDI r2, 44
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
