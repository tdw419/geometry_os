; DESCRIPTION: Places a purple 107x106 rectangle at position (175, 51).
; PLAN: r0=175(x), r1=51(y), r2=107(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 51
LDI r2, 107
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
