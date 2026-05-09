; DESCRIPTION: Places a red 20x114 rectangle at position (169, 72).
; PLAN: r0=169(x), r1=72(y), r2=20(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 72
LDI r2, 20
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
