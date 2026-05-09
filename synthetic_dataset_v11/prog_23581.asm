; DESCRIPTION: Places a purple 60x16 rectangle at position (136, 5).
; PLAN: r0=136(x), r1=5(y), r2=60(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 5
LDI r2, 60
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
