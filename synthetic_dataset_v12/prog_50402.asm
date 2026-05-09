; DESCRIPTION: Creates a orange rectangular region at (38, 91) spanning 98 by 89 pixels.
; PLAN: r0=38(x), r1=91(y), r2=98(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 91
LDI r2, 98
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
