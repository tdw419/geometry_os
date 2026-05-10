; DESCRIPTION: Places a purple 20x35 rectangle at position (50, 219).
; PLAN: r0=50(x), r1=219(y), r2=20(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 219
LDI r2, 20
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
