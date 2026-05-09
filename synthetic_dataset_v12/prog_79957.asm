; DESCRIPTION: Creates a blue rectangular region at (115, 145) spanning 117 by 102 pixels.
; PLAN: r0=115(x), r1=145(y), r2=117(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 145
LDI r2, 117
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
