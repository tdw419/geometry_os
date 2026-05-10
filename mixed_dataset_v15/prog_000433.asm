; DESCRIPTION: Renders a red line between points (164, 230) and (465, 153).
; PLAN: r0=164(x1), r1=230(y1), r2=465(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 230
LDI r2, 465
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
