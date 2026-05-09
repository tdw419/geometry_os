; DESCRIPTION: Places a purple 105x106 rectangle at position (170, 149).
; PLAN: r0=170(x), r1=149(y), r2=105(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 149
LDI r2, 105
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
