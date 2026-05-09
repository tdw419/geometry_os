; DESCRIPTION: Creates a orange rectangular region at (131, 145) spanning 31 by 79 pixels.
; PLAN: r0=131(x), r1=145(y), r2=31(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 145
LDI r2, 31
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
