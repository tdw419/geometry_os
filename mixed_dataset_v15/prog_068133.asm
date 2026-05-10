; DESCRIPTION: Creates a orange rectangular region at (241, 0) spanning 99 by 29 pixels.
; PLAN: r0=241(x), r1=0(y), r2=99(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 0
LDI r2, 99
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
