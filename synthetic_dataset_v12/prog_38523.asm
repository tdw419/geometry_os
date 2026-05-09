; DESCRIPTION: Places a purple 26x42 rectangle at position (74, 84).
; PLAN: r0=74(x), r1=84(y), r2=26(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 84
LDI r2, 26
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
