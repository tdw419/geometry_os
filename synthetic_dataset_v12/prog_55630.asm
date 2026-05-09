; DESCRIPTION: Renders a yellow line between points (374, 151) and (438, 172).
; PLAN: r0=374(x1), r1=151(y1), r2=438(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 151
LDI r2, 438
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
