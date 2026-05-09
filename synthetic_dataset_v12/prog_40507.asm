; DESCRIPTION: Renders a white line between points (446, 2) and (484, 52).
; PLAN: r0=446(x1), r1=2(y1), r2=484(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 2
LDI r2, 484
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
