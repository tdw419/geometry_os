; DESCRIPTION: Creates a orange rectangular region at (432, 146) spanning 31 by 99 pixels.
; PLAN: r0=432(x), r1=146(y), r2=31(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 146
LDI r2, 31
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
