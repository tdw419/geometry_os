; DESCRIPTION: Places a purple 16x15 rectangle at position (118, 119).
; PLAN: r0=118(x), r1=119(y), r2=16(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 119
LDI r2, 16
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
