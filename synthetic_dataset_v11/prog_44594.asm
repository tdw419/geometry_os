; DESCRIPTION: Draws a green line from (155, 210) to (36, 182).
; PLAN: r0=155(x1), r1=210(y1), r2=36(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 210
LDI r2, 36
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
