; DESCRIPTION: Renders a yellow line between points (510, 202) and (44, 240).
; PLAN: r0=510(x1), r1=202(y1), r2=44(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 202
LDI r2, 44
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
