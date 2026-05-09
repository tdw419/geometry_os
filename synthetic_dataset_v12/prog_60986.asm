; DESCRIPTION: Places a purple 28x57 rectangle at position (455, 62).
; PLAN: r0=455(x), r1=62(y), r2=28(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 62
LDI r2, 28
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
