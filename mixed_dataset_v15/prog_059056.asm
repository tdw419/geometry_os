; DESCRIPTION: Renders a magenta line between points (226, 45) and (362, 63).
; PLAN: r0=226(x1), r1=45(y1), r2=362(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 45
LDI r2, 362
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
