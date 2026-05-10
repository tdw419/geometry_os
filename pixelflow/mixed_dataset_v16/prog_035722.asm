; DESCRIPTION: Creates a blue rectangular region at (389, 133) spanning 72 by 37 pixels.
; PLAN: r0=389(x), r1=133(y), r2=72(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 133
LDI r2, 72
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
