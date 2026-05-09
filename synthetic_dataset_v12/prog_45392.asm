; DESCRIPTION: Creates a orange rectangular region at (138, 99) spanning 21 by 44 pixels.
; PLAN: r0=138(x), r1=99(y), r2=21(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 99
LDI r2, 21
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
