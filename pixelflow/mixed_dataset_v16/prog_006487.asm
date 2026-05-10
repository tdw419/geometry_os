; DESCRIPTION: Creates a blue rectangular region at (225, 99) spanning 103 by 79 pixels.
; PLAN: r0=225(x), r1=99(y), r2=103(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 99
LDI r2, 103
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
