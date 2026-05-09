; DESCRIPTION: Places a purple 39x96 rectangle at position (231, 75).
; PLAN: r0=231(x), r1=75(y), r2=39(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 75
LDI r2, 39
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
