; DESCRIPTION: Renders a green line between points (47, 133) and (494, 170).
; PLAN: r0=47(x1), r1=133(y1), r2=494(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 133
LDI r2, 494
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
