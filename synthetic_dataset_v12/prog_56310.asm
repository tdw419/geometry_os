; DESCRIPTION: Renders a blue line between points (382, 91) and (367, 33).
; PLAN: r0=382(x1), r1=91(y1), r2=367(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 91
LDI r2, 367
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
