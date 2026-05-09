; DESCRIPTION: Places a purple 81x61 rectangle at position (23, 58).
; PLAN: r0=23(x), r1=58(y), r2=81(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 58
LDI r2, 81
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
