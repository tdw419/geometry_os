; DESCRIPTION: Creates a orange rectangular region at (22, 97) spanning 68 by 32 pixels.
; PLAN: r0=22(x), r1=97(y), r2=68(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 97
LDI r2, 68
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
