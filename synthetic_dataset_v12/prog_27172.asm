; DESCRIPTION: Places a purple 48x104 rectangle at position (73, 115).
; PLAN: r0=73(x), r1=115(y), r2=48(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 115
LDI r2, 48
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
