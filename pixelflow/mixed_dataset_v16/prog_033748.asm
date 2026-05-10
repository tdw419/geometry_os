; DESCRIPTION: Places a purple 47x47 rectangle at position (63, 104).
; PLAN: r0=63(x), r1=104(y), r2=47(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 104
LDI r2, 47
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
