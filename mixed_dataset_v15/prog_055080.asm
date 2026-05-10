; DESCRIPTION: Places a purple 53x19 rectangle at position (337, 2).
; PLAN: r0=337(x), r1=2(y), r2=53(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 2
LDI r2, 53
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
