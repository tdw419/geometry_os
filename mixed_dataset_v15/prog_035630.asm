; DESCRIPTION: Renders a green line between points (325, 187) and (70, 244).
; PLAN: r0=325(x1), r1=187(y1), r2=70(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 187
LDI r2, 70
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
