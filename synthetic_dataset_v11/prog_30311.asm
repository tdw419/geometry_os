; DESCRIPTION: Places a purple 92x117 rectangle at position (99, 78).
; PLAN: r0=99(x), r1=78(y), r2=92(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 78
LDI r2, 92
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
