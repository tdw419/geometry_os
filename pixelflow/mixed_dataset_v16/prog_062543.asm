; DESCRIPTION: Places a purple 17x37 rectangle at position (352, 88).
; PLAN: r0=352(x), r1=88(y), r2=17(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 88
LDI r2, 17
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
