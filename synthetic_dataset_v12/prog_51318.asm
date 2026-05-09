; DESCRIPTION: Renders a green line between points (402, 135) and (332, 87).
; PLAN: r0=402(x1), r1=135(y1), r2=332(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 135
LDI r2, 332
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
