; DESCRIPTION: Places a purple 97x69 rectangle at position (92, 139).
; PLAN: r0=92(x), r1=139(y), r2=97(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 139
LDI r2, 97
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
