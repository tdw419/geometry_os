; DESCRIPTION: Draws a yellow line from (87, 211) to (1, 65).
; PLAN: r0=87(x1), r1=211(y1), r2=1(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 211
LDI r2, 1
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
