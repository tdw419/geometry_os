; DESCRIPTION: Creates a orange rectangular region at (418, 185) spanning 84 by 17 pixels.
; PLAN: r0=418(x), r1=185(y), r2=84(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 185
LDI r2, 84
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
