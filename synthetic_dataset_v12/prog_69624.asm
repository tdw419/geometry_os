; DESCRIPTION: Places a purple 74x96 rectangle at position (264, 141).
; PLAN: r0=264(x), r1=141(y), r2=74(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 141
LDI r2, 74
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
