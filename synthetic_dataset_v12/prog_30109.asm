; DESCRIPTION: Places a purple 69x110 rectangle at position (304, 114).
; PLAN: r0=304(x), r1=114(y), r2=69(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 114
LDI r2, 69
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
