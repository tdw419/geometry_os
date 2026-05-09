; DESCRIPTION: Renders a green line between points (135, 11) and (350, 226).
; PLAN: r0=135(x1), r1=11(y1), r2=350(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 11
LDI r2, 350
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
