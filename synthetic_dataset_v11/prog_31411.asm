; DESCRIPTION: Places a purple 80x58 rectangle at position (75, 23).
; PLAN: r0=75(x), r1=23(y), r2=80(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 23
LDI r2, 80
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
