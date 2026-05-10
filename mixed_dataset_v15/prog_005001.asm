; DESCRIPTION: Places a purple 55x97 rectangle at position (362, 118).
; PLAN: r0=362(x), r1=118(y), r2=55(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 118
LDI r2, 55
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
