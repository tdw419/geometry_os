; DESCRIPTION: Places a purple 88x36 rectangle at position (115, 37).
; PLAN: r0=115(x), r1=37(y), r2=88(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 37
LDI r2, 88
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
