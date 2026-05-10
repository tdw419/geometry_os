; DESCRIPTION: Renders a purple line between points (178, 223) and (57, 8).
; PLAN: r0=178(x1), r1=223(y1), r2=57(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 223
LDI r2, 57
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
