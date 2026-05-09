; DESCRIPTION: Renders a green line between points (320, 137) and (316, 39).
; PLAN: r0=320(x1), r1=137(y1), r2=316(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 137
LDI r2, 316
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
