; DESCRIPTION: Creates a orange rectangular region at (145, 65) spanning 86 by 114 pixels.
; PLAN: r0=145(x), r1=65(y), r2=86(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 65
LDI r2, 86
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
