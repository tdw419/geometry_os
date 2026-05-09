; DESCRIPTION: Draws a green line from (290, 56) to (65, 155).
; PLAN: r0=290(x1), r1=56(y1), r2=65(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 56
LDI r2, 65
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
