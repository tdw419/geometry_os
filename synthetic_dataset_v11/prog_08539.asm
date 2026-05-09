; DESCRIPTION: Creates a orange rectangular region at (75, 118) spanning 98 by 14 pixels.
; PLAN: r0=75(x), r1=118(y), r2=98(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 118
LDI r2, 98
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
