; DESCRIPTION: Places a purple 50x56 rectangle at position (110, 10).
; PLAN: r0=110(x), r1=10(y), r2=50(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 10
LDI r2, 50
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
