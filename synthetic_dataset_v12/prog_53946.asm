; DESCRIPTION: Renders a blue line between points (434, 65) and (319, 19).
; PLAN: r0=434(x1), r1=65(y1), r2=319(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 65
LDI r2, 319
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
