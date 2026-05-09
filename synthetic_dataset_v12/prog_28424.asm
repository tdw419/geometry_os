; DESCRIPTION: Creates a yellow rectangular region at (311, 86) spanning 63 by 11 pixels.
; PLAN: r0=311(x), r1=86(y), r2=63(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 86
LDI r2, 63
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
