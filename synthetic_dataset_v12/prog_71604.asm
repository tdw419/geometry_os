; DESCRIPTION: Renders a yellow line between points (394, 76) and (251, 83).
; PLAN: r0=394(x1), r1=76(y1), r2=251(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 76
LDI r2, 251
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
