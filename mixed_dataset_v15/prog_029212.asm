; DESCRIPTION: Renders a red line between points (114, 76) and (271, 107).
; PLAN: r0=114(x1), r1=76(y1), r2=271(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 76
LDI r2, 271
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
