; DESCRIPTION: Places a red 26x92 rectangle at position (23, 85).
; PLAN: r0=23(x), r1=85(y), r2=26(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 85
LDI r2, 26
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
