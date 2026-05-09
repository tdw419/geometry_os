; DESCRIPTION: Creates a blue rectangular region at (22, 115) spanning 111 by 47 pixels.
; PLAN: r0=22(x), r1=115(y), r2=111(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 115
LDI r2, 111
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
