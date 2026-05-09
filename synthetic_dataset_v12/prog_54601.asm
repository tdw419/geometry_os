; DESCRIPTION: Places a purple 111x101 rectangle at position (401, 67).
; PLAN: r0=401(x), r1=67(y), r2=111(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 67
LDI r2, 111
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
