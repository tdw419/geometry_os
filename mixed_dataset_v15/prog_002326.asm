; DESCRIPTION: Creates a blue rectangular region at (29, 116) spanning 111 by 45 pixels.
; PLAN: r0=29(x), r1=116(y), r2=111(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 116
LDI r2, 111
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
