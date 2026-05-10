; DESCRIPTION: Renders a green line between points (236, 29) and (112, 225).
; PLAN: r0=236(x1), r1=29(y1), r2=112(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 29
LDI r2, 112
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
