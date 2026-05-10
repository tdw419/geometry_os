; DESCRIPTION: Renders a magenta line between points (114, 137) and (460, 248).
; PLAN: r0=114(x1), r1=137(y1), r2=460(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 137
LDI r2, 460
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
