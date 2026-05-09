; DESCRIPTION: Renders a white line between points (78, 65) and (511, 26).
; PLAN: r0=78(x1), r1=65(y1), r2=511(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 65
LDI r2, 511
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
