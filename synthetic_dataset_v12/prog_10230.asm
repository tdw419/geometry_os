; DESCRIPTION: Creates a blue rectangular region at (407, 86) spanning 64 by 38 pixels.
; PLAN: r0=407(x), r1=86(y), r2=64(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 86
LDI r2, 64
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
