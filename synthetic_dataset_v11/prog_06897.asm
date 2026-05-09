; DESCRIPTION: Renders a red line between points (15, 142) and (217, 210).
; PLAN: r0=15(x1), r1=142(y1), r2=217(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 142
LDI r2, 217
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
