; DESCRIPTION: Places a red 114x101 rectangle at position (101, 12).
; PLAN: r0=101(x), r1=12(y), r2=114(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 12
LDI r2, 114
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
