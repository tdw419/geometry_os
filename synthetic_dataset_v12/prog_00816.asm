; DESCRIPTION: Renders a green line between points (391, 231) and (11, 160).
; PLAN: r0=391(x1), r1=231(y1), r2=11(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 231
LDI r2, 11
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
