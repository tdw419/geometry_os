; DESCRIPTION: Creates a orange rectangular region at (185, 40) spanning 116 by 99 pixels.
; PLAN: r0=185(x), r1=40(y), r2=116(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 40
LDI r2, 116
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
