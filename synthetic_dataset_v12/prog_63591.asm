; DESCRIPTION: Places a purple 57x34 rectangle at position (449, 13).
; PLAN: r0=449(x), r1=13(y), r2=57(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 13
LDI r2, 57
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
