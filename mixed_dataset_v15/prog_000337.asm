; DESCRIPTION: Places a purple 36x33 rectangle at position (193, 67).
; PLAN: r0=193(x), r1=67(y), r2=36(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 67
LDI r2, 36
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
