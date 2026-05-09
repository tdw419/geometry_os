; DESCRIPTION: Creates a orange rectangular region at (118, 61) spanning 14 by 112 pixels.
; PLAN: r0=118(x), r1=61(y), r2=14(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 61
LDI r2, 14
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
