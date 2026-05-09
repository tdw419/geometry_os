; DESCRIPTION: Creates a blue rectangular region at (191, 45) spanning 60 by 101 pixels.
; PLAN: r0=191(x), r1=45(y), r2=60(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 45
LDI r2, 60
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
