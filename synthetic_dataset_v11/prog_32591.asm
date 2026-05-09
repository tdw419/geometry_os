; DESCRIPTION: Creates a orange rectangular region at (37, 44) spanning 107 by 94 pixels.
; PLAN: r0=37(x), r1=44(y), r2=107(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 44
LDI r2, 107
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
