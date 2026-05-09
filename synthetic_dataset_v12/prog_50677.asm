; DESCRIPTION: Creates a orange rectangular region at (19, 75) spanning 48 by 97 pixels.
; PLAN: r0=19(x), r1=75(y), r2=48(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 75
LDI r2, 48
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
