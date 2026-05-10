; DESCRIPTION: Places a red 109x89 rectangle at position (191, 160).
; PLAN: r0=191(x), r1=160(y), r2=109(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 160
LDI r2, 109
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
