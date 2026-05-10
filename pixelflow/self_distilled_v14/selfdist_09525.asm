; DESCRIPTION: Places a purple 83x105 box at position (222, 200).
; PLAN: r0=222(x), r1=200(y), r2=83(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 200
LDI r2, 83
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
