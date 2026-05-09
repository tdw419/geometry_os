; DESCRIPTION: Creates a orange rectangular region at (433, 185) spanning 57 by 37 pixels.
; PLAN: r0=433(x), r1=185(y), r2=57(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 185
LDI r2, 57
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
