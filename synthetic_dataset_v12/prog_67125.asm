; DESCRIPTION: Places a red 21x26 rectangle at position (427, 148).
; PLAN: r0=427(x), r1=148(y), r2=21(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 148
LDI r2, 21
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
