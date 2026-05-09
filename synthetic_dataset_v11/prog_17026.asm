; DESCRIPTION: Renders a magenta line between points (113, 29) and (248, 160).
; PLAN: r0=113(x1), r1=29(y1), r2=248(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 29
LDI r2, 248
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
