; DESCRIPTION: Places a purple 88x84 rectangle at position (211, 19).
; PLAN: r0=211(x), r1=19(y), r2=88(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 19
LDI r2, 88
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
