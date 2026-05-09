; DESCRIPTION: Creates a blue rectangular region at (238, 32) spanning 14 by 49 pixels.
; PLAN: r0=238(x), r1=32(y), r2=14(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 32
LDI r2, 14
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
