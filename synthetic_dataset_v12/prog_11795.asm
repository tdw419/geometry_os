; DESCRIPTION: Renders a red line between points (276, 220) and (475, 92).
; PLAN: r0=276(x1), r1=220(y1), r2=475(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 220
LDI r2, 475
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
