; DESCRIPTION: Places a purple 74x18 rectangle at position (3, 24).
; PLAN: r0=3(x), r1=24(y), r2=74(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 24
LDI r2, 74
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
