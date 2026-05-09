; DESCRIPTION: Creates a blue rectangular region at (137, 94) spanning 81 by 111 pixels.
; PLAN: r0=137(x), r1=94(y), r2=81(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 94
LDI r2, 81
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
