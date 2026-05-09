; DESCRIPTION: Creates a orange rectangular region at (195, 136) spanning 23 by 58 pixels.
; PLAN: r0=195(x), r1=136(y), r2=23(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 136
LDI r2, 23
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
