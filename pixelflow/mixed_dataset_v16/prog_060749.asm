; DESCRIPTION: Renders a yellow line between points (391, 132) and (87, 161).
; PLAN: r0=391(x1), r1=132(y1), r2=87(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 132
LDI r2, 87
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
