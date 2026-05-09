; DESCRIPTION: Renders a red line between points (99, 230) and (127, 94).
; PLAN: r0=99(x1), r1=230(y1), r2=127(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 230
LDI r2, 127
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
