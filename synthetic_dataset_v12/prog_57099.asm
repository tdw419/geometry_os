; DESCRIPTION: Places a purple 115x60 rectangle at position (238, 103).
; PLAN: r0=238(x), r1=103(y), r2=115(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 103
LDI r2, 115
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
