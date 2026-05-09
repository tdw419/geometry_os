; DESCRIPTION: Creates a orange rectangular region at (172, 89) spanning 48 by 84 pixels.
; PLAN: r0=172(x), r1=89(y), r2=48(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 89
LDI r2, 48
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
