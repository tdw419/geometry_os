; DESCRIPTION: Places a red 54x78 rectangle at position (138, 36).
; PLAN: r0=138(x), r1=36(y), r2=54(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 36
LDI r2, 54
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
