; DESCRIPTION: Creates a blue rectangular region at (26, 183) spanning 79 by 55 pixels.
; PLAN: r0=26(x), r1=183(y), r2=79(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 183
LDI r2, 79
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
