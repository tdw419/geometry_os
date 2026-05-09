; DESCRIPTION: Renders a magenta line between points (186, 122) and (40, 143).
; PLAN: r0=186(x1), r1=122(y1), r2=40(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 122
LDI r2, 40
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
