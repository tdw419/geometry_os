; DESCRIPTION: Renders a magenta line between points (251, 239) and (158, 156).
; PLAN: r0=251(x1), r1=239(y1), r2=158(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 239
LDI r2, 158
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
