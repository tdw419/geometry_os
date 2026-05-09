; DESCRIPTION: Places a purple 97x47 rectangle at position (168, 145).
; PLAN: r0=168(x), r1=145(y), r2=97(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 145
LDI r2, 97
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
