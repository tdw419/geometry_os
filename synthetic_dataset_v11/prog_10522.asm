; DESCRIPTION: Creates a orange rectangular region at (15, 106) spanning 109 by 72 pixels.
; PLAN: r0=15(x), r1=106(y), r2=109(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 106
LDI r2, 109
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
