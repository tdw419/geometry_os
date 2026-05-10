; DESCRIPTION: Creates a blue rectangular region at (164, 51) spanning 46 by 36 pixels.
; PLAN: r0=164(x), r1=51(y), r2=46(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 51
LDI r2, 46
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
