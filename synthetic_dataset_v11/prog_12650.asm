; DESCRIPTION: Renders a green line between points (240, 160) and (10, 31).
; PLAN: r0=240(x1), r1=160(y1), r2=10(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 160
LDI r2, 10
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
