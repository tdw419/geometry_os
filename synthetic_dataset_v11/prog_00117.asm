; DESCRIPTION: Places a purple 90x60 rectangle at position (125, 151).
; PLAN: r0=125(x), r1=151(y), r2=90(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 151
LDI r2, 90
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
