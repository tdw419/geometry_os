; DESCRIPTION: Places a purple 115x103 rectangle at position (195, 139).
; PLAN: r0=195(x), r1=139(y), r2=115(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 139
LDI r2, 115
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
