; DESCRIPTION: Renders a red line between points (324, 91) and (289, 174).
; PLAN: r0=324(x1), r1=91(y1), r2=289(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 91
LDI r2, 289
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
