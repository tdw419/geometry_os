; DESCRIPTION: Places a purple 59x80 rectangle at position (18, 158).
; PLAN: r0=18(x), r1=158(y), r2=59(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 158
LDI r2, 59
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
