; DESCRIPTION: Creates a orange rectangular region at (105, 75) spanning 118 by 33 pixels.
; PLAN: r0=105(x), r1=75(y), r2=118(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 75
LDI r2, 118
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
