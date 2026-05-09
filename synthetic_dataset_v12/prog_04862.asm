; DESCRIPTION: Places a purple 23x79 rectangle at position (33, 150).
; PLAN: r0=33(x), r1=150(y), r2=23(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 150
LDI r2, 23
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
