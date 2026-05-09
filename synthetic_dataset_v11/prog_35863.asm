; DESCRIPTION: Creates a orange rectangular region at (101, 180) spanning 118 by 71 pixels.
; PLAN: r0=101(x), r1=180(y), r2=118(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 180
LDI r2, 118
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
