; DESCRIPTION: Places a purple 25x42 rectangle at position (226, 108).
; PLAN: r0=226(x), r1=108(y), r2=25(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 108
LDI r2, 25
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
