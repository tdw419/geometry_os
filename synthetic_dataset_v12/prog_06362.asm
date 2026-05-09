; DESCRIPTION: Creates a blue rectangular region at (234, 87) spanning 59 by 49 pixels.
; PLAN: r0=234(x), r1=87(y), r2=59(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 87
LDI r2, 59
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
