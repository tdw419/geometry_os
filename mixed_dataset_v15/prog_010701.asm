; DESCRIPTION: Places a purple 86x106 rectangle at position (271, 107).
; PLAN: r0=271(x), r1=107(y), r2=86(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 107
LDI r2, 86
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
