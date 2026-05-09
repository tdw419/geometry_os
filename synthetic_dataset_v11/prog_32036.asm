; DESCRIPTION: Places a purple 83x59 rectangle at position (101, 145).
; PLAN: r0=101(x), r1=145(y), r2=83(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 145
LDI r2, 83
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
