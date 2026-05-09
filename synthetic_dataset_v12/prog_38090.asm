; DESCRIPTION: Places a purple 112x80 rectangle at position (306, 104).
; PLAN: r0=306(x), r1=104(y), r2=112(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 104
LDI r2, 112
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
