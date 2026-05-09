; DESCRIPTION: Places a red 85x34 rectangle at position (166, 36).
; PLAN: r0=166(x), r1=36(y), r2=85(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 36
LDI r2, 85
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
