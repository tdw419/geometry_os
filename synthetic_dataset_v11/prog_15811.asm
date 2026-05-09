; DESCRIPTION: Places a red 79x101 rectangle at position (40, 84).
; PLAN: r0=40(x), r1=84(y), r2=79(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 84
LDI r2, 79
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
