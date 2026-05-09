; DESCRIPTION: Creates a blue rectangular region at (63, 114) spanning 23 by 110 pixels.
; PLAN: r0=63(x), r1=114(y), r2=23(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 114
LDI r2, 23
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
