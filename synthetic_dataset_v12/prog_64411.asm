; DESCRIPTION: Creates a blue rectangular region at (237, 135) spanning 67 by 111 pixels.
; PLAN: r0=237(x), r1=135(y), r2=67(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 135
LDI r2, 67
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
