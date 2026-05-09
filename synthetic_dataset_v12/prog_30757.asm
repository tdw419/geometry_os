; DESCRIPTION: Creates a orange rectangular region at (367, 91) spanning 89 by 87 pixels.
; PLAN: r0=367(x), r1=91(y), r2=89(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 91
LDI r2, 89
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
