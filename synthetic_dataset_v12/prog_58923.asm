; DESCRIPTION: Places a purple 65x118 rectangle at position (349, 124).
; PLAN: r0=349(x), r1=124(y), r2=65(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 124
LDI r2, 65
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
