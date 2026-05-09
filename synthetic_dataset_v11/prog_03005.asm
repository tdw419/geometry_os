; DESCRIPTION: Places a purple 114x69 rectangle at position (44, 28).
; PLAN: r0=44(x), r1=28(y), r2=114(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 28
LDI r2, 114
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
