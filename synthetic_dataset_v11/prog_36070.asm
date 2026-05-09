; DESCRIPTION: Places a purple 35x115 rectangle at position (165, 49).
; PLAN: r0=165(x), r1=49(y), r2=35(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 49
LDI r2, 35
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
