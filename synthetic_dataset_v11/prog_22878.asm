; DESCRIPTION: Places a purple 51x26 rectangle at position (71, 217).
; PLAN: r0=71(x), r1=217(y), r2=51(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 217
LDI r2, 51
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
