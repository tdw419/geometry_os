; DESCRIPTION: Creates a blue rectangular region at (149, 2) spanning 87 by 111 pixels.
; PLAN: r0=149(x), r1=2(y), r2=87(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 2
LDI r2, 87
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
