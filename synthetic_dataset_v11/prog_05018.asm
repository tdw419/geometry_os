; DESCRIPTION: Creates a orange rectangular region at (58, 9) spanning 107 by 29 pixels.
; PLAN: r0=58(x), r1=9(y), r2=107(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 9
LDI r2, 107
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
