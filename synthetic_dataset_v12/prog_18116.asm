; DESCRIPTION: Places a purple 104x107 rectangle at position (186, 110).
; PLAN: r0=186(x), r1=110(y), r2=104(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 110
LDI r2, 104
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
