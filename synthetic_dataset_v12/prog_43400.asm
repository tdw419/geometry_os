; DESCRIPTION: Creates a orange rectangular region at (147, 86) spanning 84 by 71 pixels.
; PLAN: r0=147(x), r1=86(y), r2=84(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 86
LDI r2, 84
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
