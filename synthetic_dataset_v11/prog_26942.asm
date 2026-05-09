; DESCRIPTION: Places a purple 107x60 rectangle at position (84, 162).
; PLAN: r0=84(x), r1=162(y), r2=107(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 162
LDI r2, 107
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
