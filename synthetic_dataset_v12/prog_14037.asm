; DESCRIPTION: Creates a orange rectangular region at (12, 2) spanning 118 by 91 pixels.
; PLAN: r0=12(x), r1=2(y), r2=118(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 2
LDI r2, 118
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
