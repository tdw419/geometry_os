; DESCRIPTION: Renders a green line between points (345, 156) and (408, 203).
; PLAN: r0=345(x1), r1=156(y1), r2=408(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 156
LDI r2, 408
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
