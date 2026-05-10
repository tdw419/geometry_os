; DESCRIPTION: Places a orange 89x98 box at position (112, 54).
; PLAN: r0=112(x), r1=54(y), r2=89(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 54
LDI r2, 89
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
