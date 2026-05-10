; DESCRIPTION: Places a red 15x114 rectangle at position (93, 138).
; PLAN: r0=93(x), r1=138(y), r2=15(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 138
LDI r2, 15
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
