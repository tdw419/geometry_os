; DESCRIPTION: Places a purple 52x94 rectangle at position (74, 25).
; PLAN: r0=74(x), r1=25(y), r2=52(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 25
LDI r2, 52
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
