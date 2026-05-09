; DESCRIPTION: Renders a red line between points (273, 124) and (186, 27).
; PLAN: r0=273(x1), r1=124(y1), r2=186(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 124
LDI r2, 186
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
