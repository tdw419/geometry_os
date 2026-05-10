; DESCRIPTION: Places a purple 81x112 rectangle at position (237, 62).
; PLAN: r0=237(x), r1=62(y), r2=81(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 62
LDI r2, 81
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
