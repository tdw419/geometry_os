; DESCRIPTION: Creates a blue rectangular region at (84, 152) spanning 53 by 51 pixels.
; PLAN: r0=84(x), r1=152(y), r2=53(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 152
LDI r2, 53
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
