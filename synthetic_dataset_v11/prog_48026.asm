; DESCRIPTION: Creates a orange rectangular region at (95, 137) spanning 84 by 63 pixels.
; PLAN: r0=95(x), r1=137(y), r2=84(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 137
LDI r2, 84
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
