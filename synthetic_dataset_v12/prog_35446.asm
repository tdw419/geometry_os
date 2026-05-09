; DESCRIPTION: Places a purple 14x78 rectangle at position (16, 173).
; PLAN: r0=16(x), r1=173(y), r2=14(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 173
LDI r2, 14
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
