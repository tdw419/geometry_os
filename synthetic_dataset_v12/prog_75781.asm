; DESCRIPTION: Creates a purple rectangular region at (81, 108) spanning 51 by 108 pixels.
; PLAN: r0=81(x), r1=108(y), r2=51(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 108
LDI r2, 51
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
