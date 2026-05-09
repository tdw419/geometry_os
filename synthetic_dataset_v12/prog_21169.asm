; DESCRIPTION: Places a purple 115x72 rectangle at position (210, 5).
; PLAN: r0=210(x), r1=5(y), r2=115(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 5
LDI r2, 115
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
