; DESCRIPTION: Places a purple 59x44 rectangle at position (30, 106).
; PLAN: r0=30(x), r1=106(y), r2=59(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 106
LDI r2, 59
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
