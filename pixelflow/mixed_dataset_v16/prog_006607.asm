; DESCRIPTION: Renders a red line between points (185, 240) and (228, 11).
; PLAN: r0=185(x1), r1=240(y1), r2=228(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 240
LDI r2, 228
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
