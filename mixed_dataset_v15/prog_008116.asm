; DESCRIPTION: Places a purple 88x64 rectangle at position (366, 50).
; PLAN: r0=366(x), r1=50(y), r2=88(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 50
LDI r2, 88
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
