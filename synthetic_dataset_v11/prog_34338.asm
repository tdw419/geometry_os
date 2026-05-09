; DESCRIPTION: Creates a blue rectangular region at (142, 8) spanning 57 by 38 pixels.
; PLAN: r0=142(x), r1=8(y), r2=57(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 8
LDI r2, 57
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
