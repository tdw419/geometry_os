; DESCRIPTION: Places a yellow 114x54 rectangle at position (91, 61).
; PLAN: r0=91(x), r1=61(y), r2=114(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 61
LDI r2, 114
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
