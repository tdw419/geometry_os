; DESCRIPTION: Places a purple 10x115 rectangle at position (426, 20).
; PLAN: r0=426(x), r1=20(y), r2=10(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 20
LDI r2, 10
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
