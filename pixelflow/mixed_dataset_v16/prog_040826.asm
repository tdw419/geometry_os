; DESCRIPTION: Creates a blue rectangular region at (446, 132) spanning 55 by 69 pixels.
; PLAN: r0=446(x), r1=132(y), r2=55(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 132
LDI r2, 55
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
