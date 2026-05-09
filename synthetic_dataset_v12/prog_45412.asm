; DESCRIPTION: Renders a green line between points (44, 118) and (209, 83).
; PLAN: r0=44(x1), r1=118(y1), r2=209(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 118
LDI r2, 209
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
