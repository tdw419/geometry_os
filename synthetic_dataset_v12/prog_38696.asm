; DESCRIPTION: Creates a orange rectangular region at (191, 91) spanning 106 by 94 pixels.
; PLAN: r0=191(x), r1=91(y), r2=106(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 91
LDI r2, 106
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
