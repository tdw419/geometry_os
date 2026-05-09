; DESCRIPTION: Renders a black line between points (393, 180) and (156, 165).
; PLAN: r0=393(x1), r1=180(y1), r2=156(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 180
LDI r2, 156
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
