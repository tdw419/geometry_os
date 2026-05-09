; DESCRIPTION: Renders a magenta line between points (300, 230) and (96, 202).
; PLAN: r0=300(x1), r1=230(y1), r2=96(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 230
LDI r2, 96
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
