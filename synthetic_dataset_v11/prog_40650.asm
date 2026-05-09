; DESCRIPTION: Renders a green line between points (48, 219) and (138, 2).
; PLAN: r0=48(x1), r1=219(y1), r2=138(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 219
LDI r2, 138
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
