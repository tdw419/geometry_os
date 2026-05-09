; DESCRIPTION: Renders a red line between points (442, 177) and (285, 26).
; PLAN: r0=442(x1), r1=177(y1), r2=285(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 177
LDI r2, 285
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
