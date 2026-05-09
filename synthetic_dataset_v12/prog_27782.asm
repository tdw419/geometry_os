; DESCRIPTION: Places a purple 52x115 rectangle at position (188, 90).
; PLAN: r0=188(x), r1=90(y), r2=52(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 90
LDI r2, 52
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
