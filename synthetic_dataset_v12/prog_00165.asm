; DESCRIPTION: Creates a blue rectangular region at (385, 126) spanning 22 by 58 pixels.
; PLAN: r0=385(x), r1=126(y), r2=22(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 126
LDI r2, 22
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
