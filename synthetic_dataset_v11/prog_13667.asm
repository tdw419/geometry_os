; DESCRIPTION: Renders a green line between points (166, 34) and (7, 48).
; PLAN: r0=166(x1), r1=34(y1), r2=7(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 34
LDI r2, 7
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
