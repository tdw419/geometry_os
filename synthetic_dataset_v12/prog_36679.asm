; DESCRIPTION: Creates a orange rectangular region at (94, 49) spanning 16 by 26 pixels.
; PLAN: r0=94(x), r1=49(y), r2=16(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 49
LDI r2, 16
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
