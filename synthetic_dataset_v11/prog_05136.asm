; DESCRIPTION: Creates a blue rectangular region at (22, 194) spanning 19 by 31 pixels.
; PLAN: r0=22(x), r1=194(y), r2=19(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 194
LDI r2, 19
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
