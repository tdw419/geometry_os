; DESCRIPTION: Creates a blue rectangular region at (139, 87) spanning 12 by 75 pixels.
; PLAN: r0=139(x), r1=87(y), r2=12(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 87
LDI r2, 12
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
