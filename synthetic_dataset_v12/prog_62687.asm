; DESCRIPTION: Renders a magenta line between points (236, 113) and (427, 174).
; PLAN: r0=236(x1), r1=113(y1), r2=427(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 113
LDI r2, 427
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
