; DESCRIPTION: Places a purple 80x114 rectangle at position (105, 83).
; PLAN: r0=105(x), r1=83(y), r2=80(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 83
LDI r2, 80
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
