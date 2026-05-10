; DESCRIPTION: Creates a blue rectangular region at (201, 32) spanning 113 by 14 pixels.
; PLAN: r0=201(x), r1=32(y), r2=113(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 32
LDI r2, 113
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
