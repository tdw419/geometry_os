; DESCRIPTION: Creates a orange rectangular region at (319, 9) spanning 94 by 31 pixels.
; PLAN: r0=319(x), r1=9(y), r2=94(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 9
LDI r2, 94
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
