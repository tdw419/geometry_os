; DESCRIPTION: Places a orange 16x114 rectangle at position (169, 71).
; PLAN: r0=169(x), r1=71(y), r2=16(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 71
LDI r2, 16
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
