; DESCRIPTION: Renders a green line between points (396, 0) and (437, 52).
; PLAN: r0=396(x1), r1=0(y1), r2=437(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 0
LDI r2, 437
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
