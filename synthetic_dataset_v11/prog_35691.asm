; DESCRIPTION: Renders a cyan line between points (20, 77) and (235, 91).
; PLAN: r0=20(x1), r1=77(y1), r2=235(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 77
LDI r2, 235
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
