; DESCRIPTION: Places a purple 70x39 rectangle at position (93, 58).
; PLAN: r0=93(x), r1=58(y), r2=70(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 58
LDI r2, 70
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
