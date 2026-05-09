; DESCRIPTION: Places a purple 91x96 rectangle at position (122, 23).
; PLAN: r0=122(x), r1=23(y), r2=91(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 23
LDI r2, 91
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
