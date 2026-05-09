; DESCRIPTION: Places a red 99x117 rectangle at position (229, 61).
; PLAN: r0=229(x), r1=61(y), r2=99(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 61
LDI r2, 99
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
