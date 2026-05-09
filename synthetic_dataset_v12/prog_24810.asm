; DESCRIPTION: Creates a orange rectangular region at (177, 91) spanning 65 by 118 pixels.
; PLAN: r0=177(x), r1=91(y), r2=65(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 91
LDI r2, 65
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
