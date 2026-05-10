; DESCRIPTION: Renders a yellow line between points (193, 60) and (475, 48).
; PLAN: r0=193(x1), r1=60(y1), r2=475(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 60
LDI r2, 475
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
