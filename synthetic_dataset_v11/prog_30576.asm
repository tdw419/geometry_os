; DESCRIPTION: Renders a yellow line between points (167, 230) and (179, 200).
; PLAN: r0=167(x1), r1=230(y1), r2=179(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 230
LDI r2, 179
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
