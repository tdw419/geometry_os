; DESCRIPTION: Renders a white line between points (438, 144) and (77, 48).
; PLAN: r0=438(x1), r1=144(y1), r2=77(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 144
LDI r2, 77
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
