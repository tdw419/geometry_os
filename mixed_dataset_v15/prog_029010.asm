; DESCRIPTION: Creates a blue rectangular region at (248, 156) spanning 56 by 75 pixels.
; PLAN: r0=248(x), r1=156(y), r2=56(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 156
LDI r2, 56
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
