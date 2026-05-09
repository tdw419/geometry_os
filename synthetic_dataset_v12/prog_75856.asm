; DESCRIPTION: Places a purple 93x114 rectangle at position (165, 10).
; PLAN: r0=165(x), r1=10(y), r2=93(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 10
LDI r2, 93
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
