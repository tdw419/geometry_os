; DESCRIPTION: Creates a blue rectangular region at (3, 9) spanning 75 by 37 pixels.
; PLAN: r0=3(x), r1=9(y), r2=75(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 9
LDI r2, 75
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
