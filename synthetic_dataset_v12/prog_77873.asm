; DESCRIPTION: Renders a purple line between points (317, 138) and (130, 215).
; PLAN: r0=317(x1), r1=138(y1), r2=130(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 138
LDI r2, 130
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
