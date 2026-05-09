; DESCRIPTION: Renders a yellow line between points (98, 21) and (235, 132).
; PLAN: r0=98(x1), r1=21(y1), r2=235(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 21
LDI r2, 235
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
