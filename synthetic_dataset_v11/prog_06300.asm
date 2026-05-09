; DESCRIPTION: Places a purple 84x109 rectangle at position (3, 119).
; PLAN: r0=3(x), r1=119(y), r2=84(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 119
LDI r2, 84
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
