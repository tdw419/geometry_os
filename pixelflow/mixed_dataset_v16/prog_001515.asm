; DESCRIPTION: Creates a orange rectangular region at (323, 86) spanning 73 by 46 pixels.
; PLAN: r0=323(x), r1=86(y), r2=73(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 86
LDI r2, 73
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
