; DESCRIPTION: Creates a orange rectangular region at (151, 155) spanning 56 by 65 pixels.
; PLAN: r0=151(x), r1=155(y), r2=56(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 155
LDI r2, 56
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
