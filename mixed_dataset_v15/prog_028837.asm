; DESCRIPTION: Places a purple 68x93 rectangle at position (84, 27).
; PLAN: r0=84(x), r1=27(y), r2=68(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 27
LDI r2, 68
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
