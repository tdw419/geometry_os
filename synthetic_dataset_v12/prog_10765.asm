; DESCRIPTION: Creates a blue rectangular region at (345, 118) spanning 100 by 86 pixels.
; PLAN: r0=345(x), r1=118(y), r2=100(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 118
LDI r2, 100
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
