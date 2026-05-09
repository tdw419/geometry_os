; DESCRIPTION: Places a purple 105x84 rectangle at position (115, 42).
; PLAN: r0=115(x), r1=42(y), r2=105(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 42
LDI r2, 105
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
