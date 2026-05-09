; DESCRIPTION: Renders a black line between points (330, 166) and (84, 30).
; PLAN: r0=330(x1), r1=166(y1), r2=84(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 166
LDI r2, 84
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
