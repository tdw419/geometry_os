; DESCRIPTION: Places a purple 57x11 rectangle at position (104, 178).
; PLAN: r0=104(x), r1=178(y), r2=57(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 178
LDI r2, 57
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
