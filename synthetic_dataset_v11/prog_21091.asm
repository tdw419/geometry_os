; DESCRIPTION: Places a purple 88x48 rectangle at position (74, 52).
; PLAN: r0=74(x), r1=52(y), r2=88(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 52
LDI r2, 88
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
