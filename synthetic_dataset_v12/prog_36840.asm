; DESCRIPTION: Renders a red line between points (194, 97) and (441, 27).
; PLAN: r0=194(x1), r1=97(y1), r2=441(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 97
LDI r2, 441
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
