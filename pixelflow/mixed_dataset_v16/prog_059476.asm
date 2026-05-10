; DESCRIPTION: Places a purple 85x110 rectangle at position (258, 27).
; PLAN: r0=258(x), r1=27(y), r2=85(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 27
LDI r2, 85
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
