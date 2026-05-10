; DESCRIPTION: Renders a blue line between points (493, 103) and (299, 114).
; PLAN: r0=493(x1), r1=103(y1), r2=299(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 103
LDI r2, 299
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
