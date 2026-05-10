; DESCRIPTION: Places a purple 115x105 rectangle at position (347, 148).
; PLAN: r0=347(x), r1=148(y), r2=115(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 148
LDI r2, 115
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
