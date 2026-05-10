; DESCRIPTION: Draws a green line from (23, 89) to (81, 167).
; PLAN: r0=23(x1), r1=89(y1), r2=81(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 89
LDI r2, 81
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
