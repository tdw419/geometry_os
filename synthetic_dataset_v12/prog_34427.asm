; DESCRIPTION: Renders a magenta line between points (362, 96) and (222, 241).
; PLAN: r0=362(x1), r1=96(y1), r2=222(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 96
LDI r2, 222
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
