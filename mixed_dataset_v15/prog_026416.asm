; DESCRIPTION: Renders a magenta line between points (468, 4) and (362, 52).
; PLAN: r0=468(x1), r1=4(y1), r2=362(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 4
LDI r2, 362
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
