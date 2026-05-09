; DESCRIPTION: Creates a blue rectangular region at (212, 23) spanning 81 by 54 pixels.
; PLAN: r0=212(x), r1=23(y), r2=81(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 23
LDI r2, 81
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
