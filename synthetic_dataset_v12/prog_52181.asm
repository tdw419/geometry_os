; DESCRIPTION: Renders a yellow line between points (46, 209) and (44, 185).
; PLAN: r0=46(x1), r1=209(y1), r2=44(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 209
LDI r2, 44
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
