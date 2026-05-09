; DESCRIPTION: Renders a magenta line between points (399, 230) and (466, 32).
; PLAN: r0=399(x1), r1=230(y1), r2=466(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 230
LDI r2, 466
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
