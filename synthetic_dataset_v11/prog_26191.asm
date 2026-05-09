; DESCRIPTION: Renders a purple line between points (255, 40) and (223, 63).
; PLAN: r0=255(x1), r1=40(y1), r2=223(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 40
LDI r2, 223
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
