; DESCRIPTION: Places a green 58x97 rectangle at position (89, 54).
; PLAN: r0=89(x), r1=54(y), r2=58(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 54
LDI r2, 58
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
