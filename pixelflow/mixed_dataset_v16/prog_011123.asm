; DESCRIPTION: Renders a green line between points (293, 95) and (219, 152).
; PLAN: r0=293(x1), r1=95(y1), r2=219(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 95
LDI r2, 219
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
