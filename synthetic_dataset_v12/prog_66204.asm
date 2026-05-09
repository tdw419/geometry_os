; DESCRIPTION: Places a purple 16x36 rectangle at position (49, 141).
; PLAN: r0=49(x), r1=141(y), r2=16(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 141
LDI r2, 16
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
