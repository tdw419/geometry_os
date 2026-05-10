; DESCRIPTION: Renders a red line between points (409, 240) and (223, 195).
; PLAN: r0=409(x1), r1=240(y1), r2=223(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 240
LDI r2, 223
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
