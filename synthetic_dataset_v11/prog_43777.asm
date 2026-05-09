; DESCRIPTION: Places a purple 84x78 rectangle at position (151, 9).
; PLAN: r0=151(x), r1=9(y), r2=84(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 9
LDI r2, 84
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
