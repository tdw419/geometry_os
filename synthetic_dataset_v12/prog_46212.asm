; DESCRIPTION: Places a red 95x89 rectangle at position (377, 159).
; PLAN: r0=377(x), r1=159(y), r2=95(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 159
LDI r2, 95
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
