; DESCRIPTION: Renders a purple line between points (460, 232) and (230, 208).
; PLAN: r0=460(x1), r1=232(y1), r2=230(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 232
LDI r2, 230
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
