; DESCRIPTION: Places a purple 98x54 rectangle at position (118, 99).
; PLAN: r0=118(x), r1=99(y), r2=98(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 99
LDI r2, 98
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
