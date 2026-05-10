; DESCRIPTION: Renders a yellow line between points (338, 157) and (433, 140).
; PLAN: r0=338(x1), r1=157(y1), r2=433(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 157
LDI r2, 433
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
