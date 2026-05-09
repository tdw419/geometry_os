; DESCRIPTION: Places a purple 52x35 rectangle at position (176, 93).
; PLAN: r0=176(x), r1=93(y), r2=52(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 93
LDI r2, 52
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
