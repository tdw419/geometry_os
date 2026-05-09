; DESCRIPTION: Renders a black line between points (84, 57) and (330, 98).
; PLAN: r0=84(x1), r1=57(y1), r2=330(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 57
LDI r2, 330
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
