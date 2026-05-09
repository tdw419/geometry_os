; DESCRIPTION: Renders a purple line between points (223, 2) and (294, 117).
; PLAN: r0=223(x1), r1=2(y1), r2=294(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 2
LDI r2, 294
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
