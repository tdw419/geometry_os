; DESCRIPTION: Places a purple 107x36 rectangle at position (90, 15).
; PLAN: r0=90(x), r1=15(y), r2=107(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 15
LDI r2, 107
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
