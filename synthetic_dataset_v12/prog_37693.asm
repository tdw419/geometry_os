; DESCRIPTION: Places a purple 57x10 rectangle at position (412, 68).
; PLAN: r0=412(x), r1=68(y), r2=57(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 68
LDI r2, 57
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
