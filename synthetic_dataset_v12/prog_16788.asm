; DESCRIPTION: Places a purple 24x114 rectangle at position (169, 63).
; PLAN: r0=169(x), r1=63(y), r2=24(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 63
LDI r2, 24
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
