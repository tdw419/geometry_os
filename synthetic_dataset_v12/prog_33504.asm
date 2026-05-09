; DESCRIPTION: Places a purple 40x25 rectangle at position (155, 7).
; PLAN: r0=155(x), r1=7(y), r2=40(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 7
LDI r2, 40
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
