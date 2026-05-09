; DESCRIPTION: Renders a red line between points (396, 93) and (393, 175).
; PLAN: r0=396(x1), r1=93(y1), r2=393(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 93
LDI r2, 393
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
