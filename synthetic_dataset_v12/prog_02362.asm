; DESCRIPTION: Creates a orange rectangular region at (393, 102) spanning 86 by 89 pixels.
; PLAN: r0=393(x), r1=102(y), r2=86(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 102
LDI r2, 86
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
