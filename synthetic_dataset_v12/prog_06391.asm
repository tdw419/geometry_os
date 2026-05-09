; DESCRIPTION: Renders a red line between points (33, 93) and (124, 209).
; PLAN: r0=33(x1), r1=93(y1), r2=124(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 93
LDI r2, 124
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
