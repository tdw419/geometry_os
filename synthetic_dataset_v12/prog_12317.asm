; DESCRIPTION: Creates a orange rectangular region at (219, 87) spanning 89 by 40 pixels.
; PLAN: r0=219(x), r1=87(y), r2=89(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 87
LDI r2, 89
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
