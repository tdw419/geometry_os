; DESCRIPTION: Places a purple 23x16 rectangle at position (170, 61).
; PLAN: r0=170(x), r1=61(y), r2=23(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 61
LDI r2, 23
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
