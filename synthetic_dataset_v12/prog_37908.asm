; DESCRIPTION: Renders a yellow line between points (235, 39) and (340, 90).
; PLAN: r0=235(x1), r1=39(y1), r2=340(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 39
LDI r2, 340
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
