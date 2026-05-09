; DESCRIPTION: Places a purple 23x81 rectangle at position (131, 153).
; PLAN: r0=131(x), r1=153(y), r2=23(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 153
LDI r2, 23
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
