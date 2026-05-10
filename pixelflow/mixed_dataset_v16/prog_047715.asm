; DESCRIPTION: Renders a red line segment connecting (272, 58) to (289, 59).
; PLAN: r0=272(x1), r1=58(y1), r2=289(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 58
LDI r2, 289
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
