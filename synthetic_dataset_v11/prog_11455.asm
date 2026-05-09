; DESCRIPTION: Places a purple 17x30 rectangle at position (15, 205).
; PLAN: r0=15(x), r1=205(y), r2=17(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 205
LDI r2, 17
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
