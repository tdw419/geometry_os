; DESCRIPTION: Places a purple 52x70 rectangle at position (343, 10).
; PLAN: r0=343(x), r1=10(y), r2=52(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 10
LDI r2, 52
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
