; DESCRIPTION: Creates a blue rectangular region at (127, 66) spanning 88 by 23 pixels.
; PLAN: r0=127(x), r1=66(y), r2=88(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 66
LDI r2, 88
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
