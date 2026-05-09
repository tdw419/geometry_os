; DESCRIPTION: Places a red 19x89 rectangle at position (229, 153).
; PLAN: r0=229(x), r1=153(y), r2=19(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 153
LDI r2, 19
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
