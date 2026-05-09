; DESCRIPTION: Renders a red line between points (283, 72) and (368, 189).
; PLAN: r0=283(x1), r1=72(y1), r2=368(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 72
LDI r2, 368
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
