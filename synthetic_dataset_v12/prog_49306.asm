; DESCRIPTION: Renders a red line between points (397, 118) and (298, 209).
; PLAN: r0=397(x1), r1=118(y1), r2=298(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 118
LDI r2, 298
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
