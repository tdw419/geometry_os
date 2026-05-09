; DESCRIPTION: Renders a magenta line between points (438, 12) and (494, 250).
; PLAN: r0=438(x1), r1=12(y1), r2=494(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 12
LDI r2, 494
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
