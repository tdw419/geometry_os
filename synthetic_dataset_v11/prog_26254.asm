; DESCRIPTION: Creates a orange rectangular region at (98, 91) spanning 114 by 54 pixels.
; PLAN: r0=98(x), r1=91(y), r2=114(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 91
LDI r2, 114
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
