; DESCRIPTION: Renders a red line between points (487, 52) and (418, 14).
; PLAN: r0=487(x1), r1=52(y1), r2=418(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 52
LDI r2, 418
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
