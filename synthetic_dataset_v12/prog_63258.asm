; DESCRIPTION: Renders a red line between points (145, 8) and (446, 71).
; PLAN: r0=145(x1), r1=8(y1), r2=446(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 8
LDI r2, 446
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
