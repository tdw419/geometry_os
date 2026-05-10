; DESCRIPTION: Creates a blue rectangular region at (38, 19) spanning 81 by 58 pixels.
; PLAN: r0=38(x), r1=19(y), r2=81(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 19
LDI r2, 81
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
