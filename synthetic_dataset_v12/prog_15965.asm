; DESCRIPTION: Renders a magenta line between points (338, 66) and (465, 63).
; PLAN: r0=338(x1), r1=66(y1), r2=465(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 66
LDI r2, 465
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
