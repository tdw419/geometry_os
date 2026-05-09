; DESCRIPTION: Places a red 109x99 rectangle at position (185, 61).
; PLAN: r0=185(x), r1=61(y), r2=109(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 61
LDI r2, 109
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
