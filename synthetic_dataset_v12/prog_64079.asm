; DESCRIPTION: Renders a magenta line between points (57, 159) and (290, 221).
; PLAN: r0=57(x1), r1=159(y1), r2=290(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 159
LDI r2, 290
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
