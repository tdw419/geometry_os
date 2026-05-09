; DESCRIPTION: Draws a green line from (100, 52) to (184, 33).
; PLAN: r0=100(x1), r1=52(y1), r2=184(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 52
LDI r2, 184
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
