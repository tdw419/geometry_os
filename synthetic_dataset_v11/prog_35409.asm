; DESCRIPTION: Places a blue 14x69 rectangle at position (139, 162).
; PLAN: r0=139(x), r1=162(y), r2=14(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 162
LDI r2, 14
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
