; DESCRIPTION: Renders a red line between points (66, 44) and (29, 91).
; PLAN: r0=66(x1), r1=44(y1), r2=29(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 44
LDI r2, 29
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
