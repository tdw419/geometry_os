; DESCRIPTION: Creates a blue rectangular region at (93, 79) spanning 117 by 79 pixels.
; PLAN: r0=93(x), r1=79(y), r2=117(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 79
LDI r2, 117
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
