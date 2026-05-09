; DESCRIPTION: Renders a blue line between points (140, 93) and (425, 5).
; PLAN: r0=140(x1), r1=93(y1), r2=425(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 93
LDI r2, 425
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
