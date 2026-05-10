; DESCRIPTION: Renders a yellow line between points (198, 23) and (453, 220).
; PLAN: r0=198(x1), r1=23(y1), r2=453(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 23
LDI r2, 453
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
