; DESCRIPTION: Renders a magenta line between points (137, 27) and (30, 44).
; PLAN: r0=137(x1), r1=27(y1), r2=30(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 27
LDI r2, 30
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
