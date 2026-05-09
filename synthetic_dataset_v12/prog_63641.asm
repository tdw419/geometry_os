; DESCRIPTION: Creates a orange rectangular region at (39, 23) spanning 82 by 83 pixels.
; PLAN: r0=39(x), r1=23(y), r2=82(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 23
LDI r2, 82
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
