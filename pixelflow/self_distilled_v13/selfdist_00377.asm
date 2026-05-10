; DESCRIPTION: Places a purple 119x105 box at position (350, 127).
; PLAN: r0=350(x), r1=127(y), r2=119(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 127
LDI r2, 119
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
