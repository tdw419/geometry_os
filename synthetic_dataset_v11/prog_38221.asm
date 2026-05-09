; DESCRIPTION: Places a purple 59x69 rectangle at position (52, 49).
; PLAN: r0=52(x), r1=49(y), r2=59(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 49
LDI r2, 59
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
