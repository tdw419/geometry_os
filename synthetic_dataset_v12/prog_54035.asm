; DESCRIPTION: Creates a blue rectangular region at (409, 0) spanning 79 by 116 pixels.
; PLAN: r0=409(x), r1=0(y), r2=79(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 0
LDI r2, 79
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
