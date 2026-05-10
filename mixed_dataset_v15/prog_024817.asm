; DESCRIPTION: Creates a orange rectangular region at (319, 143) spanning 22 by 49 pixels.
; PLAN: r0=319(x), r1=143(y), r2=22(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 143
LDI r2, 22
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
