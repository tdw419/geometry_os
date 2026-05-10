; DESCRIPTION: Places a purple 90x49 rectangle at position (422, 23).
; PLAN: r0=422(x), r1=23(y), r2=90(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 23
LDI r2, 90
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
