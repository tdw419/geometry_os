; DESCRIPTION: Renders a blue line between points (37, 143) and (221, 126).
; PLAN: r0=37(x1), r1=143(y1), r2=221(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 143
LDI r2, 221
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
