; DESCRIPTION: Renders a yellow line between points (127, 29) and (293, 49).
; PLAN: r0=127(x1), r1=29(y1), r2=293(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 29
LDI r2, 293
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
