; DESCRIPTION: Creates a orange rectangular region at (23, 45) spanning 102 by 37 pixels.
; PLAN: r0=23(x), r1=45(y), r2=102(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 45
LDI r2, 102
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
