; DESCRIPTION: Creates a orange rectangular region at (62, 118) spanning 109 by 13 pixels.
; PLAN: r0=62(x), r1=118(y), r2=109(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 118
LDI r2, 109
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
