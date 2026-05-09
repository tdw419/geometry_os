; DESCRIPTION: Places a purple 52x12 rectangle at position (211, 5).
; PLAN: r0=211(x), r1=5(y), r2=52(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 5
LDI r2, 52
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
