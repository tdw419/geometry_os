; DESCRIPTION: Creates a orange rectangular region at (324, 25) spanning 118 by 96 pixels.
; PLAN: r0=324(x), r1=25(y), r2=118(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 25
LDI r2, 118
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
