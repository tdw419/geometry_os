; DESCRIPTION: Creates a blue rectangular region at (223, 99) spanning 86 by 23 pixels.
; PLAN: r0=223(x), r1=99(y), r2=86(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 99
LDI r2, 86
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
