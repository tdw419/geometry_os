; DESCRIPTION: Renders a red line between points (289, 195) and (99, 56).
; PLAN: r0=289(x1), r1=195(y1), r2=99(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 195
LDI r2, 99
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
