; DESCRIPTION: Places a purple 70x117 rectangle at position (39, 49).
; PLAN: r0=39(x), r1=49(y), r2=70(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 49
LDI r2, 70
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
