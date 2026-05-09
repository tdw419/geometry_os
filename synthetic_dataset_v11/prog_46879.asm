; DESCRIPTION: Creates a orange rectangular region at (192, 57) spanning 26 by 73 pixels.
; PLAN: r0=192(x), r1=57(y), r2=26(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 57
LDI r2, 26
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
