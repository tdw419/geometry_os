; DESCRIPTION: Places a purple 11x53 rectangle at position (89, 93).
; PLAN: r0=89(x), r1=93(y), r2=11(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 93
LDI r2, 11
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
