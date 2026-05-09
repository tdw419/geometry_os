; DESCRIPTION: Renders a magenta line between points (217, 236) and (362, 11).
; PLAN: r0=217(x1), r1=236(y1), r2=362(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 236
LDI r2, 362
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
