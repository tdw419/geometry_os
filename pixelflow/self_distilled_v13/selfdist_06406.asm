; DESCRIPTION: Places a red 26x61 box at position (67, 123).
; PLAN: r0=67(x), r1=123(y), r2=26(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 123
LDI r2, 26
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
