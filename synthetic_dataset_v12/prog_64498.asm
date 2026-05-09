; DESCRIPTION: Places a red 109x117 rectangle at position (85, 77).
; PLAN: r0=85(x), r1=77(y), r2=109(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 77
LDI r2, 109
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
