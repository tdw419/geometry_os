; DESCRIPTION: Places a purple 38x39 rectangle at position (216, 104).
; PLAN: r0=216(x), r1=104(y), r2=38(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 104
LDI r2, 38
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
