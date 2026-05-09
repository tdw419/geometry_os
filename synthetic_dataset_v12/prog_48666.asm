; DESCRIPTION: Places a purple 51x90 rectangle at position (147, 24).
; PLAN: r0=147(x), r1=24(y), r2=51(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 24
LDI r2, 51
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
