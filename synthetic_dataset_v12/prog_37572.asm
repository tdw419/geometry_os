; DESCRIPTION: Creates a orange rectangular region at (147, 134) spanning 17 by 84 pixels.
; PLAN: r0=147(x), r1=134(y), r2=17(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 134
LDI r2, 17
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
