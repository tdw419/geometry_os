; DESCRIPTION: Places a purple 47x79 rectangle at position (37, 138).
; PLAN: r0=37(x), r1=138(y), r2=47(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 138
LDI r2, 47
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
