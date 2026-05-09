; DESCRIPTION: Draws a yellow line from (252, 220) to (233, 177).
; PLAN: r0=252(x1), r1=220(y1), r2=233(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 220
LDI r2, 233
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
