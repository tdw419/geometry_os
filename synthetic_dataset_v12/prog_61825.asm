; DESCRIPTION: Places a black 118x79 rectangle at position (162, 2).
; PLAN: r0=162(x), r1=2(y), r2=118(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 2
LDI r2, 118
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
