; DESCRIPTION: Places a purple 66x54 rectangle at position (145, 156).
; PLAN: r0=145(x), r1=156(y), r2=66(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 156
LDI r2, 66
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
