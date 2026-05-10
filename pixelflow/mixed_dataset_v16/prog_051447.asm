; DESCRIPTION: Places a green 58x85 rectangle at position (88, 138).
; PLAN: r0=88(x), r1=138(y), r2=58(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 138
LDI r2, 58
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
