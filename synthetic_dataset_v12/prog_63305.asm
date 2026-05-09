; DESCRIPTION: Creates a blue rectangular region at (127, 51) spanning 73 by 73 pixels.
; PLAN: r0=127(x), r1=51(y), r2=73(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 51
LDI r2, 73
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
