; DESCRIPTION: Creates a orange rectangular region at (82, 84) spanning 49 by 105 pixels.
; PLAN: r0=82(x), r1=84(y), r2=49(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 84
LDI r2, 49
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
