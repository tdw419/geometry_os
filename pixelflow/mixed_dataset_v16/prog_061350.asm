; DESCRIPTION: Places a purple 60x62 rectangle at position (136, 173).
; PLAN: r0=136(x), r1=173(y), r2=60(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 173
LDI r2, 60
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
