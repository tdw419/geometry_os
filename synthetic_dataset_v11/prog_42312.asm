; DESCRIPTION: Renders a magenta line between points (143, 253) and (204, 7).
; PLAN: r0=143(x1), r1=253(y1), r2=204(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 253
LDI r2, 204
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
