; DESCRIPTION: Renders a red line between points (298, 240) and (7, 66).
; PLAN: r0=298(x1), r1=240(y1), r2=7(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 240
LDI r2, 7
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
