; DESCRIPTION: Renders a red line between points (17, 29) and (196, 235).
; PLAN: r0=17(x1), r1=29(y1), r2=196(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 29
LDI r2, 196
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
