; DESCRIPTION: Renders a green line between points (48, 202) and (366, 145).
; PLAN: r0=48(x1), r1=202(y1), r2=366(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 202
LDI r2, 366
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
