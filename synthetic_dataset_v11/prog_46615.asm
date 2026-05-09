; DESCRIPTION: Places a red line segment connecting (230, 151) to (121, 144).
; PLAN: r0=230(x1), r1=151(y1), r2=121(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 151
LDI r2, 121
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
