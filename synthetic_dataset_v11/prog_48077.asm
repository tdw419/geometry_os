; DESCRIPTION: Places a magenta line segment connecting (57, 74) to (51, 146).
; PLAN: r0=57(x1), r1=74(y1), r2=51(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 74
LDI r2, 51
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
