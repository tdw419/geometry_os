; DESCRIPTION: Places a purple 92x106 box at position (70, 58).
; PLAN: r0=70(x), r1=58(y), r2=92(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 58
LDI r2, 92
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
