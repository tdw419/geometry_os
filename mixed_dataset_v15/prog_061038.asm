; DESCRIPTION: Renders a red line between points (295, 72) and (109, 37).
; PLAN: r0=295(x1), r1=72(y1), r2=109(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 72
LDI r2, 109
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
