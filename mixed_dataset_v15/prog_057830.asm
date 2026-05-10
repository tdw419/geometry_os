; DESCRIPTION: Renders a magenta line between points (96, 178) and (211, 125).
; PLAN: r0=96(x1), r1=178(y1), r2=211(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 178
LDI r2, 211
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
