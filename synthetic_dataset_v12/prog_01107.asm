; DESCRIPTION: Draws a magenta line from (306, 51) to (136, 146).
; PLAN: r0=306(x1), r1=51(y1), r2=136(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 51
LDI r2, 136
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
