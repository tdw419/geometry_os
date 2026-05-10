; DESCRIPTION: Creates a purple rectangular region at (368, 98) spanning 51 by 99 pixels.
; PLAN: r0=368(x), r1=98(y), r2=51(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 98
LDI r2, 51
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
