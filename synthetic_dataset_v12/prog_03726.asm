; DESCRIPTION: Creates a orange rectangular region at (166, 207) spanning 44 by 34 pixels.
; PLAN: r0=166(x), r1=207(y), r2=44(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 207
LDI r2, 44
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
