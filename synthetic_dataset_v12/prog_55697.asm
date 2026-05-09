; DESCRIPTION: Places a purple 116x57 rectangle at position (103, 2).
; PLAN: r0=103(x), r1=2(y), r2=116(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 2
LDI r2, 116
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
