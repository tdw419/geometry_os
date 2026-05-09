; DESCRIPTION: Creates a blue rectangular region at (11, 45) spanning 70 by 59 pixels.
; PLAN: r0=11(x), r1=45(y), r2=70(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 45
LDI r2, 70
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
