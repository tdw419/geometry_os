; DESCRIPTION: Creates a orange rectangular region at (132, 192) spanning 37 by 10 pixels.
; PLAN: r0=132(x), r1=192(y), r2=37(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 192
LDI r2, 37
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
