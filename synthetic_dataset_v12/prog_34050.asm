; DESCRIPTION: Renders a green line between points (302, 37) and (373, 235).
; PLAN: r0=302(x1), r1=37(y1), r2=373(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 37
LDI r2, 373
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
