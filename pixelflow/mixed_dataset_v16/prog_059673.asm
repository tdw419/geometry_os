; DESCRIPTION: Places a purple 15x19 box at position (74, 138).
; PLAN: r0=74(x), r1=138(y), r2=15(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 138
LDI r2, 15
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
