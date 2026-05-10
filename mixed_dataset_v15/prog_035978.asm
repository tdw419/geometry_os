; DESCRIPTION: Draws a green line from (184, 23) to (26, 77).
; PLAN: r0=184(x1), r1=23(y1), r2=26(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 23
LDI r2, 26
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
