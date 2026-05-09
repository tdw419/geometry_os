; DESCRIPTION: Renders a white line between points (245, 188) and (90, 66).
; PLAN: r0=245(x1), r1=188(y1), r2=90(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 188
LDI r2, 90
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
