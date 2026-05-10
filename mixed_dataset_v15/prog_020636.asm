; DESCRIPTION: Creates a orange rectangular region at (227, 142) spanning 84 by 57 pixels.
; PLAN: r0=227(x), r1=142(y), r2=84(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 142
LDI r2, 84
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
