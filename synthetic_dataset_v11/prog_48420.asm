; DESCRIPTION: Renders a red line between points (104, 235) and (33, 206).
; PLAN: r0=104(x1), r1=235(y1), r2=33(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 235
LDI r2, 33
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
