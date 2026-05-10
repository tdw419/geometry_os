; DESCRIPTION: Places a yellow 54x114 rectangle at position (99, 30).
; PLAN: r0=99(x), r1=30(y), r2=54(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 30
LDI r2, 54
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
