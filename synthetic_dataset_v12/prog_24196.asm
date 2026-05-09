; DESCRIPTION: Places a purple 24x94 rectangle at position (297, 80).
; PLAN: r0=297(x), r1=80(y), r2=24(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 80
LDI r2, 24
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
