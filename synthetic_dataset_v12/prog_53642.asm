; DESCRIPTION: Renders a yellow line between points (486, 186) and (391, 26).
; PLAN: r0=486(x1), r1=186(y1), r2=391(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 186
LDI r2, 391
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
