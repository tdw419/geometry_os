; DESCRIPTION: Places a purple 93x115 rectangle at position (240, 119).
; PLAN: r0=240(x), r1=119(y), r2=93(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 119
LDI r2, 93
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
