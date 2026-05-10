; DESCRIPTION: Renders a red line between points (269, 235) and (126, 76).
; PLAN: r0=269(x1), r1=235(y1), r2=126(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 235
LDI r2, 126
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
