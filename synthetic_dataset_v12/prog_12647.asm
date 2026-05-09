; DESCRIPTION: Creates a orange rectangular region at (112, 103) spanning 106 by 68 pixels.
; PLAN: r0=112(x), r1=103(y), r2=106(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 103
LDI r2, 106
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
