; DESCRIPTION: Places a purple 118x69 rectangle at position (95, 59).
; PLAN: r0=95(x), r1=59(y), r2=118(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 59
LDI r2, 118
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
