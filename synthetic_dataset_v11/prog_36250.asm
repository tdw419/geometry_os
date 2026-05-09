; DESCRIPTION: Renders a green line between points (236, 65) and (134, 196).
; PLAN: r0=236(x1), r1=65(y1), r2=134(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 65
LDI r2, 134
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
