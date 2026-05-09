; DESCRIPTION: Creates a orange rectangular region at (155, 99) spanning 25 by 37 pixels.
; PLAN: r0=155(x), r1=99(y), r2=25(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 99
LDI r2, 25
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
