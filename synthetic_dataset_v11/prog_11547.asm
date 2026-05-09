; DESCRIPTION: Creates a orange rectangular region at (114, 57) spanning 99 by 80 pixels.
; PLAN: r0=114(x), r1=57(y), r2=99(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 57
LDI r2, 99
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
