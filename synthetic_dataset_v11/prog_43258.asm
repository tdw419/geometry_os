; DESCRIPTION: Creates a blue rectangular region at (51, 131) spanning 74 by 99 pixels.
; PLAN: r0=51(x), r1=131(y), r2=74(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 131
LDI r2, 74
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
