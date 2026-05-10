; DESCRIPTION: Creates a blue rectangular region at (448, 140) spanning 37 by 46 pixels.
; PLAN: r0=448(x), r1=140(y), r2=37(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 140
LDI r2, 37
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
