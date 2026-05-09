; DESCRIPTION: Renders a green line between points (130, 180) and (142, 214).
; PLAN: r0=130(x1), r1=180(y1), r2=142(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 180
LDI r2, 142
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
