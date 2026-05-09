; DESCRIPTION: Creates a orange rectangular region at (24, 125) spanning 62 by 105 pixels.
; PLAN: r0=24(x), r1=125(y), r2=62(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 125
LDI r2, 62
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
