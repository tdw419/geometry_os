; DESCRIPTION: Renders a blue line between points (365, 61) and (315, 52).
; PLAN: r0=365(x1), r1=61(y1), r2=315(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 61
LDI r2, 315
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
