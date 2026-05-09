; DESCRIPTION: Creates a blue rectangular region at (358, 47) spanning 62 by 13 pixels.
; PLAN: r0=358(x), r1=47(y), r2=62(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 47
LDI r2, 62
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
