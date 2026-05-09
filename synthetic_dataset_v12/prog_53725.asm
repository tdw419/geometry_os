; DESCRIPTION: Renders a green line between points (277, 38) and (391, 90).
; PLAN: r0=277(x1), r1=38(y1), r2=391(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 38
LDI r2, 391
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
