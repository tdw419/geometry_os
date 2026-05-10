; DESCRIPTION: Renders a red line between points (400, 76) and (258, 48).
; PLAN: r0=400(x1), r1=76(y1), r2=258(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 76
LDI r2, 258
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
