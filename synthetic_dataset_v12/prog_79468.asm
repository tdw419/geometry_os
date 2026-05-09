; DESCRIPTION: Renders a magenta line between points (339, 87) and (144, 234).
; PLAN: r0=339(x1), r1=87(y1), r2=144(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 87
LDI r2, 144
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
