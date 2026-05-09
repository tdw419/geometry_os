; DESCRIPTION: Renders a yellow line between points (156, 97) and (251, 164).
; PLAN: r0=156(x1), r1=97(y1), r2=251(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 251
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
