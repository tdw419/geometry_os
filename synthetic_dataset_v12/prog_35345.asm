; DESCRIPTION: Creates a blue rectangular region at (133, 40) spanning 79 by 65 pixels.
; PLAN: r0=133(x), r1=40(y), r2=79(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 40
LDI r2, 79
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
