; DESCRIPTION: Creates a orange rectangular region at (183, 144) spanning 58 by 105 pixels.
; PLAN: r0=183(x), r1=144(y), r2=58(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 144
LDI r2, 58
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
