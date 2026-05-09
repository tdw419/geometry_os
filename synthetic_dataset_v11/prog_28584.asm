; DESCRIPTION: Renders a green line between points (114, 108) and (143, 251).
; PLAN: r0=114(x1), r1=108(y1), r2=143(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 108
LDI r2, 143
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
