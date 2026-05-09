; DESCRIPTION: Places a purple 119x120 rectangle at position (145, 4).
; PLAN: r0=145(x), r1=4(y), r2=119(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 4
LDI r2, 119
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
