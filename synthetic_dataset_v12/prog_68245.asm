; DESCRIPTION: Places a purple 17x65 rectangle at position (186, 53).
; PLAN: r0=186(x), r1=53(y), r2=17(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 53
LDI r2, 17
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
