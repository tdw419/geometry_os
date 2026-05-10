; DESCRIPTION: Draws a magenta line from (253, 74) to (506, 89).
; PLAN: r0=253(x1), r1=74(y1), r2=506(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 74
LDI r2, 506
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
