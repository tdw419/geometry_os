; DESCRIPTION: Places a purple 33x72 rectangle at position (66, 85).
; PLAN: r0=66(x), r1=85(y), r2=33(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 85
LDI r2, 33
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
