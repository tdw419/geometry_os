; DESCRIPTION: Renders a yellow line between points (197, 195) and (389, 33).
; PLAN: r0=197(x1), r1=195(y1), r2=389(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 195
LDI r2, 389
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
