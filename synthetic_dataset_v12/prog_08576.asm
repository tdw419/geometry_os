; DESCRIPTION: Renders a green line between points (286, 156) and (415, 185).
; PLAN: r0=286(x1), r1=156(y1), r2=415(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 156
LDI r2, 415
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
