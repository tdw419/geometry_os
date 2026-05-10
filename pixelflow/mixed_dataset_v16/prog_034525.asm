; DESCRIPTION: Places a purple 69x12 rectangle at position (111, 175).
; PLAN: r0=111(x), r1=175(y), r2=69(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 175
LDI r2, 69
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
