; DESCRIPTION: Creates a blue rectangular region at (345, 71) spanning 102 by 87 pixels.
; PLAN: r0=345(x), r1=71(y), r2=102(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 71
LDI r2, 102
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
