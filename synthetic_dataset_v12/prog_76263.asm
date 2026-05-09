; DESCRIPTION: Places a magenta 95x114 rectangle at position (169, 117).
; PLAN: r0=169(x), r1=117(y), r2=95(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 117
LDI r2, 95
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
