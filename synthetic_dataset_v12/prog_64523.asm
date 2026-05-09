; DESCRIPTION: Places a purple 37x14 rectangle at position (426, 90).
; PLAN: r0=426(x), r1=90(y), r2=37(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 90
LDI r2, 37
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
