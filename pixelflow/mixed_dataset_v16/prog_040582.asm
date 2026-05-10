; DESCRIPTION: Places a green 61x15 box at position (133, 119).
; PLAN: r0=133(x), r1=119(y), r2=61(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 119
LDI r2, 61
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
