; DESCRIPTION: Renders a green line between points (108, 6) and (391, 17).
; PLAN: r0=108(x1), r1=6(y1), r2=391(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 6
LDI r2, 391
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
