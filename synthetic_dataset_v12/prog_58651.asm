; DESCRIPTION: Places a purple 32x13 rectangle at position (283, 93).
; PLAN: r0=283(x), r1=93(y), r2=32(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 93
LDI r2, 32
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
