; DESCRIPTION: Places a purple 14x36 rectangle at position (28, 115).
; PLAN: r0=28(x), r1=115(y), r2=14(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 115
LDI r2, 14
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
