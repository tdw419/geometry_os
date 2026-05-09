; DESCRIPTION: Renders a magenta line between points (127, 44) and (211, 187).
; PLAN: r0=127(x1), r1=44(y1), r2=211(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 44
LDI r2, 211
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
