; DESCRIPTION: Renders a yellow line between points (216, 10) and (465, 28).
; PLAN: r0=216(x1), r1=10(y1), r2=465(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 10
LDI r2, 465
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
