; DESCRIPTION: Places a purple 79x115 rectangle at position (163, 108).
; PLAN: r0=163(x), r1=108(y), r2=79(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 108
LDI r2, 79
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
