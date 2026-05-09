; DESCRIPTION: Renders a black line between points (168, 80) and (236, 44).
; PLAN: r0=168(x1), r1=80(y1), r2=236(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 80
LDI r2, 236
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
