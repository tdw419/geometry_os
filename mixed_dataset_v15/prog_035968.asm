; DESCRIPTION: Draws a magenta line from (242, 51) to (208, 141).
; PLAN: r0=242(x1), r1=51(y1), r2=208(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 51
LDI r2, 208
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
