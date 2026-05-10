; DESCRIPTION: Places a purple 53x81 rectangle at position (16, 34).
; PLAN: r0=16(x), r1=34(y), r2=53(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 34
LDI r2, 53
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
