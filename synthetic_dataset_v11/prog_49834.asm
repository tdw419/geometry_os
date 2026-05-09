; DESCRIPTION: Renders a blue line between points (0, 23) and (9, 236).
; PLAN: r0=0(x1), r1=23(y1), r2=9(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 23
LDI r2, 9
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
