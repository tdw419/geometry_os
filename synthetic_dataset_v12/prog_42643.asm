; DESCRIPTION: Places a purple 114x55 rectangle at position (165, 198).
; PLAN: r0=165(x), r1=198(y), r2=114(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 198
LDI r2, 114
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
