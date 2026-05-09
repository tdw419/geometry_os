; DESCRIPTION: Renders a blue line between points (493, 255) and (48, 241).
; PLAN: r0=493(x1), r1=255(y1), r2=48(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 255
LDI r2, 48
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
