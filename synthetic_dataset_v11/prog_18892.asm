; DESCRIPTION: Creates a orange rectangular region at (151, 169) spanning 54 by 34 pixels.
; PLAN: r0=151(x), r1=169(y), r2=54(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 169
LDI r2, 54
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
