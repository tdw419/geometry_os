; DESCRIPTION: Renders a magenta line between points (478, 183) and (174, 236).
; PLAN: r0=478(x1), r1=183(y1), r2=174(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 183
LDI r2, 174
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
