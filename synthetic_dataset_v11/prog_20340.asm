; DESCRIPTION: Creates a blue rectangular region at (51, 122) spanning 111 by 48 pixels.
; PLAN: r0=51(x), r1=122(y), r2=111(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 122
LDI r2, 111
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
