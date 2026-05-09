; DESCRIPTION: Renders a green line between points (145, 117) and (1, 48).
; PLAN: r0=145(x1), r1=117(y1), r2=1(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 117
LDI r2, 1
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
