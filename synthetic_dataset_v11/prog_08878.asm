; DESCRIPTION: Creates a blue rectangular region at (45, 43) spanning 54 by 58 pixels.
; PLAN: r0=45(x), r1=43(y), r2=54(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 43
LDI r2, 54
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
