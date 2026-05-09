; DESCRIPTION: Draws a green line from (52, 79) to (192, 123).
; PLAN: r0=52(x1), r1=79(y1), r2=192(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 79
LDI r2, 192
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
