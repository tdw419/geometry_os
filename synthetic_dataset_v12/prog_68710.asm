; DESCRIPTION: Places a purple 59x108 rectangle at position (59, 13).
; PLAN: r0=59(x), r1=13(y), r2=59(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 13
LDI r2, 59
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
