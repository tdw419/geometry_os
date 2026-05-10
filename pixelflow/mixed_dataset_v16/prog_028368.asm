; DESCRIPTION: Creates a blue rectangular region at (3, 178) spanning 106 by 65 pixels.
; PLAN: r0=3(x), r1=178(y), r2=106(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 178
LDI r2, 106
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
