; DESCRIPTION: Creates a orange rectangular region at (141, 91) spanning 91 by 52 pixels.
; PLAN: r0=141(x), r1=91(y), r2=91(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 91
LDI r2, 91
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
