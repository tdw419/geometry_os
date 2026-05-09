; DESCRIPTION: Renders a red line between points (235, 154) and (297, 40).
; PLAN: r0=235(x1), r1=154(y1), r2=297(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 154
LDI r2, 297
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
