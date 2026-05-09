; DESCRIPTION: Creates a orange rectangular region at (142, 144) spanning 97 by 63 pixels.
; PLAN: r0=142(x), r1=144(y), r2=97(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 144
LDI r2, 97
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
