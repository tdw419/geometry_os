; DESCRIPTION: Renders a green line between points (475, 95) and (511, 93).
; PLAN: r0=475(x1), r1=95(y1), r2=511(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 95
LDI r2, 511
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
