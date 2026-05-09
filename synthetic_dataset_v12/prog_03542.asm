; DESCRIPTION: Renders a green line between points (44, 99) and (497, 143).
; PLAN: r0=44(x1), r1=99(y1), r2=497(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 99
LDI r2, 497
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
