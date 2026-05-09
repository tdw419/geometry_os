; DESCRIPTION: Renders a yellow line between points (255, 179) and (309, 51).
; PLAN: r0=255(x1), r1=179(y1), r2=309(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 179
LDI r2, 309
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
