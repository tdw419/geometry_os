; DESCRIPTION: Places a red 49x89 rectangle at position (133, 84).
; PLAN: r0=133(x), r1=84(y), r2=49(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 84
LDI r2, 49
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
