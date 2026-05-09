; DESCRIPTION: Creates a purple rectangular region at (51, 160) spanning 21 by 58 pixels.
; PLAN: r0=51(x), r1=160(y), r2=21(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 160
LDI r2, 21
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
