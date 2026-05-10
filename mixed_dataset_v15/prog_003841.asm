; DESCRIPTION: Renders a red line between points (367, 13) and (511, 10).
; PLAN: r0=367(x1), r1=13(y1), r2=511(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 13
LDI r2, 511
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
