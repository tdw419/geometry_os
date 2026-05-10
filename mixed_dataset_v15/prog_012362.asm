; DESCRIPTION: Places a purple 13x24 rectangle at position (330, 158).
; PLAN: r0=330(x), r1=158(y), r2=13(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 158
LDI r2, 13
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
