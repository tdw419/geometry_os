; DESCRIPTION: Places a purple 22x56 rectangle at position (188, 133).
; PLAN: r0=188(x), r1=133(y), r2=22(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 133
LDI r2, 22
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
