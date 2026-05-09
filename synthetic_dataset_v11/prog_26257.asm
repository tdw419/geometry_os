; DESCRIPTION: Places a purple 117x53 rectangle at position (40, 108).
; PLAN: r0=40(x), r1=108(y), r2=117(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 108
LDI r2, 117
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
