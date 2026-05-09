; DESCRIPTION: Places a purple 48x13 rectangle at position (75, 104).
; PLAN: r0=75(x), r1=104(y), r2=48(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 104
LDI r2, 48
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
