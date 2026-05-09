; DESCRIPTION: Creates a blue rectangular region at (337, 20) spanning 65 by 100 pixels.
; PLAN: r0=337(x), r1=20(y), r2=65(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 20
LDI r2, 65
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
