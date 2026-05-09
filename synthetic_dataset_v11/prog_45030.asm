; DESCRIPTION: Creates a yellow rectangular region at (11, 117) spanning 99 by 68 pixels.
; PLAN: r0=11(x), r1=117(y), r2=99(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 117
LDI r2, 99
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
