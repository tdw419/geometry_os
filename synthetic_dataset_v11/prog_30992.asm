; DESCRIPTION: Creates a orange rectangular region at (13, 118) spanning 107 by 22 pixels.
; PLAN: r0=13(x), r1=118(y), r2=107(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 118
LDI r2, 107
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
