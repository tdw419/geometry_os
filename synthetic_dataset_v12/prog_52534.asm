; DESCRIPTION: Places a purple 66x79 rectangle at position (365, 56).
; PLAN: r0=365(x), r1=56(y), r2=66(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 56
LDI r2, 66
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
