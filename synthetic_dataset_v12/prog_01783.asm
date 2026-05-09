; DESCRIPTION: Renders a green line between points (157, 206) and (266, 193).
; PLAN: r0=157(x1), r1=206(y1), r2=266(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 206
LDI r2, 266
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
