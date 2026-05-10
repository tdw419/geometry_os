; DESCRIPTION: Renders a red line between points (124, 222) and (466, 209).
; PLAN: r0=124(x1), r1=222(y1), r2=466(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 222
LDI r2, 466
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
