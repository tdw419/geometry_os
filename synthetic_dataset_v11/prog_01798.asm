; DESCRIPTION: Renders a magenta line between points (51, 210) and (43, 230).
; PLAN: r0=51(x1), r1=210(y1), r2=43(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 210
LDI r2, 43
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
