; DESCRIPTION: Creates a orange rectangular region at (139, 132) spanning 94 by 46 pixels.
; PLAN: r0=139(x), r1=132(y), r2=94(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 132
LDI r2, 94
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
