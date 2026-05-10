; DESCRIPTION: Creates a blue rectangular region at (383, 51) spanning 14 by 87 pixels.
; PLAN: r0=383(x), r1=51(y), r2=14(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 51
LDI r2, 14
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
