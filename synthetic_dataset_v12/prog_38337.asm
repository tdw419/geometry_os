; DESCRIPTION: Renders a green line between points (474, 220) and (438, 65).
; PLAN: r0=474(x1), r1=220(y1), r2=438(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 220
LDI r2, 438
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
