; DESCRIPTION: Renders a yellow line between points (72, 229) and (220, 160).
; PLAN: r0=72(x1), r1=229(y1), r2=220(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 229
LDI r2, 220
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
