; DESCRIPTION: Places a purple 97x104 rectangle at position (264, 147).
; PLAN: r0=264(x), r1=147(y), r2=97(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 147
LDI r2, 97
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
