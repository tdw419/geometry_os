; DESCRIPTION: Renders a magenta line between points (32, 84) and (174, 251).
; PLAN: r0=32(x1), r1=84(y1), r2=174(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 84
LDI r2, 174
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
