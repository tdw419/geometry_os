; DESCRIPTION: Places a purple 114x10 rectangle at position (230, 163).
; PLAN: r0=230(x), r1=163(y), r2=114(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 163
LDI r2, 114
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
