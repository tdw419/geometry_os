; DESCRIPTION: Places a purple 50x84 rectangle at position (169, 26).
; PLAN: r0=169(x), r1=26(y), r2=50(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 26
LDI r2, 50
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
