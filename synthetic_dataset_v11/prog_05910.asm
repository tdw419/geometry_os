; DESCRIPTION: Places a purple 104x31 rectangle at position (70, 17).
; PLAN: r0=70(x), r1=17(y), r2=104(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 17
LDI r2, 104
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
