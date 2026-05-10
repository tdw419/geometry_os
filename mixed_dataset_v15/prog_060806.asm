; DESCRIPTION: Places a purple 101x113 rectangle at position (231, 97).
; PLAN: r0=231(x), r1=97(y), r2=101(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 97
LDI r2, 101
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
