; DESCRIPTION: Renders a magenta line between points (248, 10) and (361, 6).
; PLAN: r0=248(x1), r1=10(y1), r2=361(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 10
LDI r2, 361
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
