; DESCRIPTION: Renders a orange line between points (246, 87) and (511, 16).
; PLAN: r0=246(x1), r1=87(y1), r2=511(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 87
LDI r2, 511
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
