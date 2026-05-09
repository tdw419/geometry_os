; DESCRIPTION: Creates a orange rectangular region at (100, 82) spanning 18 by 13 pixels.
; PLAN: r0=100(x), r1=82(y), r2=18(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 82
LDI r2, 18
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
