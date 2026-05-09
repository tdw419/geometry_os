; DESCRIPTION: Places a purple 118x20 rectangle at position (320, 180).
; PLAN: r0=320(x), r1=180(y), r2=118(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 180
LDI r2, 118
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
