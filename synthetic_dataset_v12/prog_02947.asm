; DESCRIPTION: Renders a yellow line between points (232, 195) and (127, 132).
; PLAN: r0=232(x1), r1=195(y1), r2=127(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 195
LDI r2, 127
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
