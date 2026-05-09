; DESCRIPTION: Places a purple 75x90 rectangle at position (14, 45).
; PLAN: r0=14(x), r1=45(y), r2=75(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 45
LDI r2, 75
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
