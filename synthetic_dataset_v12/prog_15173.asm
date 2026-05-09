; DESCRIPTION: Places a purple 72x93 rectangle at position (422, 71).
; PLAN: r0=422(x), r1=71(y), r2=72(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 71
LDI r2, 72
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
