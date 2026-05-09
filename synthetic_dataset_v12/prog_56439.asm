; DESCRIPTION: Renders a green line between points (322, 90) and (338, 186).
; PLAN: r0=322(x1), r1=90(y1), r2=338(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 90
LDI r2, 338
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
