; DESCRIPTION: Places a purple 103x114 rectangle at position (153, 115).
; PLAN: r0=153(x), r1=115(y), r2=103(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 115
LDI r2, 103
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
