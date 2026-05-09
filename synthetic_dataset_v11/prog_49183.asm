; DESCRIPTION: Renders a magenta line between points (183, 143) and (65, 81).
; PLAN: r0=183(x1), r1=143(y1), r2=65(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 143
LDI r2, 65
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
