; DESCRIPTION: Places a orange 116x117 box at position (205, 117).
; PLAN: r0=205(x), r1=117(y), r2=116(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 117
LDI r2, 116
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
