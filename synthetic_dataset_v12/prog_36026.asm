; DESCRIPTION: Renders a green line between points (413, 147) and (74, 135).
; PLAN: r0=413(x1), r1=147(y1), r2=74(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 147
LDI r2, 74
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
