; DESCRIPTION: Renders a yellow line between points (360, 130) and (438, 225).
; PLAN: r0=360(x1), r1=130(y1), r2=438(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 130
LDI r2, 438
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
