; DESCRIPTION: Creates a blue rectangular region at (353, 136) spanning 65 by 111 pixels.
; PLAN: r0=353(x), r1=136(y), r2=65(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 136
LDI r2, 65
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
