; DESCRIPTION: Renders a green line between points (382, 18) and (377, 220).
; PLAN: r0=382(x1), r1=18(y1), r2=377(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 18
LDI r2, 377
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
