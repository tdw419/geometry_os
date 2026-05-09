; DESCRIPTION: Places a red 86x112 rectangle at position (158, 31).
; PLAN: r0=158(x), r1=31(y), r2=86(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 31
LDI r2, 86
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
