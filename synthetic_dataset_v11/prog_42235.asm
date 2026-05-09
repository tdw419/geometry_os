; DESCRIPTION: Places a purple 19x117 rectangle at position (38, 4).
; PLAN: r0=38(x), r1=4(y), r2=19(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 4
LDI r2, 19
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
