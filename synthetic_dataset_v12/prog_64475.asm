; DESCRIPTION: Renders a magenta line between points (109, 142) and (445, 97).
; PLAN: r0=109(x1), r1=142(y1), r2=445(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 142
LDI r2, 445
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
