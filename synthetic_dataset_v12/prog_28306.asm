; DESCRIPTION: Renders a green line between points (321, 250) and (350, 110).
; PLAN: r0=321(x1), r1=250(y1), r2=350(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 250
LDI r2, 350
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
