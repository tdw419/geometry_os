; DESCRIPTION: Places a purple 48x36 rectangle at position (104, 158).
; PLAN: r0=104(x), r1=158(y), r2=48(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 158
LDI r2, 48
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
