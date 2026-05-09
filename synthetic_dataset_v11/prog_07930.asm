; DESCRIPTION: Creates a orange rectangular region at (44, 142) spanning 58 by 37 pixels.
; PLAN: r0=44(x), r1=142(y), r2=58(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 142
LDI r2, 58
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
