; DESCRIPTION: Places a purple 59x23 rectangle at position (18, 81).
; PLAN: r0=18(x), r1=81(y), r2=59(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 81
LDI r2, 59
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
