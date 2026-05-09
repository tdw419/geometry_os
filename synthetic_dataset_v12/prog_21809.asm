; DESCRIPTION: Creates a orange rectangular region at (266, 240) spanning 97 by 14 pixels.
; PLAN: r0=266(x), r1=240(y), r2=97(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 240
LDI r2, 97
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
