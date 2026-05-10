; DESCRIPTION: Renders a magenta line between points (453, 137) and (239, 158).
; PLAN: r0=453(x1), r1=137(y1), r2=239(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 137
LDI r2, 239
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
