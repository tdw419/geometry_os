; DESCRIPTION: Places a purple 74x69 rectangle at position (73, 132).
; PLAN: r0=73(x), r1=132(y), r2=74(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 132
LDI r2, 74
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
