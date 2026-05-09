; DESCRIPTION: Renders a green line between points (217, 5) and (178, 155).
; PLAN: r0=217(x1), r1=5(y1), r2=178(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 5
LDI r2, 178
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
