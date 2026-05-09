; DESCRIPTION: Creates a orange rectangular region at (82, 100) spanning 27 by 31 pixels.
; PLAN: r0=82(x), r1=100(y), r2=27(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 100
LDI r2, 27
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
