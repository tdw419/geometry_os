; DESCRIPTION: Renders a magenta line between points (127, 241) and (109, 125).
; PLAN: r0=127(x1), r1=241(y1), r2=109(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 241
LDI r2, 109
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
