; DESCRIPTION: Renders a magenta line between points (122, 54) and (293, 231).
; PLAN: r0=122(x1), r1=54(y1), r2=293(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 54
LDI r2, 293
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
