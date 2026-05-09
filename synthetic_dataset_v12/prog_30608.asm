; DESCRIPTION: Creates a orange rectangular region at (148, 26) spanning 20 by 107 pixels.
; PLAN: r0=148(x), r1=26(y), r2=20(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 26
LDI r2, 20
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
