; DESCRIPTION: Renders a red line between points (124, 203) and (286, 255).
; PLAN: r0=124(x1), r1=203(y1), r2=286(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 203
LDI r2, 286
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
