; DESCRIPTION: Creates a blue rectangular region at (80, 85) spanning 69 by 59 pixels.
; PLAN: r0=80(x), r1=85(y), r2=69(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 85
LDI r2, 69
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
