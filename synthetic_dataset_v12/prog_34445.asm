; DESCRIPTION: Renders a magenta line between points (229, 57) and (425, 186).
; PLAN: r0=229(x1), r1=57(y1), r2=425(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 57
LDI r2, 425
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
