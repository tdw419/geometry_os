; DESCRIPTION: Renders a purple line between points (342, 12) and (206, 171).
; PLAN: r0=342(x1), r1=12(y1), r2=206(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 12
LDI r2, 206
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
