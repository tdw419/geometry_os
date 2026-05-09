; DESCRIPTION: Creates a yellow rectangular region at (99, 63) spanning 39 by 70 pixels.
; PLAN: r0=99(x), r1=63(y), r2=39(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 63
LDI r2, 39
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
