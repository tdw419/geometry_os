; DESCRIPTION: Renders a black line between points (394, 194) and (56, 246).
; PLAN: r0=394(x1), r1=194(y1), r2=56(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 194
LDI r2, 56
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
