; DESCRIPTION: Creates a blue rectangular region at (191, 53) spanning 48 by 106 pixels.
; PLAN: r0=191(x), r1=53(y), r2=48(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 53
LDI r2, 48
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
