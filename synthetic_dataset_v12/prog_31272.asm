; DESCRIPTION: Places a purple 109x117 rectangle at position (313, 3).
; PLAN: r0=313(x), r1=3(y), r2=109(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 3
LDI r2, 109
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
