; DESCRIPTION: Renders a red line between points (371, 18) and (112, 28).
; PLAN: r0=371(x1), r1=18(y1), r2=112(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 18
LDI r2, 112
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
