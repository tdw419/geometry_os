; DESCRIPTION: Renders a yellow line between points (340, 110) and (280, 235).
; PLAN: r0=340(x1), r1=110(y1), r2=280(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 110
LDI r2, 280
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
