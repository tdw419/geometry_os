; DESCRIPTION: Creates a blue rectangular region at (19, 46) spanning 63 by 33 pixels.
; PLAN: r0=19(x), r1=46(y), r2=63(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 46
LDI r2, 63
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
