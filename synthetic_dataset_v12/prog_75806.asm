; DESCRIPTION: Renders a red line between points (339, 20) and (488, 75).
; PLAN: r0=339(x1), r1=20(y1), r2=488(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 20
LDI r2, 488
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
