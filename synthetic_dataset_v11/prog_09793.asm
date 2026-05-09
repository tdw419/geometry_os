; DESCRIPTION: Places a purple 117x117 rectangle at position (90, 138).
; PLAN: r0=90(x), r1=138(y), r2=117(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 138
LDI r2, 117
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
