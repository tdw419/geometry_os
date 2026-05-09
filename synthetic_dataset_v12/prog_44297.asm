; DESCRIPTION: Creates a orange rectangular region at (252, 93) spanning 96 by 118 pixels.
; PLAN: r0=252(x), r1=93(y), r2=96(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 93
LDI r2, 96
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
