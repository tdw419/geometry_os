; DESCRIPTION: Places a purple 67x72 box at position (324, 127).
; PLAN: r0=324(x), r1=127(y), r2=67(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 127
LDI r2, 67
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
