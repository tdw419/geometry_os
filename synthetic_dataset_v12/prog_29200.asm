; DESCRIPTION: Renders a red line between points (436, 56) and (102, 126).
; PLAN: r0=436(x1), r1=56(y1), r2=102(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 56
LDI r2, 102
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
