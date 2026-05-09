; DESCRIPTION: Creates a orange rectangular region at (83, 77) spanning 38 by 79 pixels.
; PLAN: r0=83(x), r1=77(y), r2=38(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 77
LDI r2, 38
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
