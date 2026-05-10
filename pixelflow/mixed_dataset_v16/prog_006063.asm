; DESCRIPTION: Places a purple 82x81 box at position (161, 101).
; PLAN: r0=161(x), r1=101(y), r2=82(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 101
LDI r2, 82
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
