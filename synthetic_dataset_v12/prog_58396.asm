; DESCRIPTION: Places a purple 115x20 rectangle at position (185, 234).
; PLAN: r0=185(x), r1=234(y), r2=115(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 234
LDI r2, 115
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
