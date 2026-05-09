; DESCRIPTION: Renders a magenta line between points (461, 98) and (250, 241).
; PLAN: r0=461(x1), r1=98(y1), r2=250(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 98
LDI r2, 250
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
