; DESCRIPTION: Renders a green line between points (140, 205) and (435, 235).
; PLAN: r0=140(x1), r1=205(y1), r2=435(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 205
LDI r2, 435
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
