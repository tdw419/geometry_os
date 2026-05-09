; DESCRIPTION: Renders a red line between points (298, 199) and (317, 138).
; PLAN: r0=298(x1), r1=199(y1), r2=317(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 199
LDI r2, 317
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
