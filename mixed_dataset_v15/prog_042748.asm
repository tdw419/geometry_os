; DESCRIPTION: Creates a orange rectangular region at (95, 118) spanning 105 by 14 pixels.
; PLAN: r0=95(x), r1=118(y), r2=105(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 118
LDI r2, 105
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
