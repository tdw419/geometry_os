; DESCRIPTION: Creates a orange rectangular region at (391, 119) spanning 62 by 36 pixels.
; PLAN: r0=391(x), r1=119(y), r2=62(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 119
LDI r2, 62
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
