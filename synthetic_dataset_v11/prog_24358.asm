; DESCRIPTION: Places a purple 119x80 rectangle at position (131, 70).
; PLAN: r0=131(x), r1=70(y), r2=119(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 70
LDI r2, 119
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
