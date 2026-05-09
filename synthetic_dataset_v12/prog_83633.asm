; DESCRIPTION: Renders a purple line between points (246, 151) and (308, 125).
; PLAN: r0=246(x1), r1=151(y1), r2=308(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 151
LDI r2, 308
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
