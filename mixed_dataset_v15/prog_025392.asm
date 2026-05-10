; DESCRIPTION: Places a purple 83x105 rectangle at position (220, 119).
; PLAN: r0=220(x), r1=119(y), r2=83(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 119
LDI r2, 83
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
