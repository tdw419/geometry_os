; DESCRIPTION: Renders a black line between points (454, 50) and (202, 162).
; PLAN: r0=454(x1), r1=50(y1), r2=202(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 50
LDI r2, 202
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
