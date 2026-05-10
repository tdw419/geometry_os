; DESCRIPTION: Renders a magenta line between points (265, 223) and (44, 198).
; PLAN: r0=265(x1), r1=223(y1), r2=44(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 223
LDI r2, 44
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
